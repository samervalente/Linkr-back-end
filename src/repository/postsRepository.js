import connection from "../database/postgre.js";
import getHashtagsIds from "../utils/getHashtagIds.js";

async function publishUrl(url, text, userId, title, image, description) {
  const { rows: result } = await connection.query(
    ` 
    INSERT INTO posts (url, description, "userId", "urlTitle", "urlImage", "urlDescription") 
    VALUES ($1, $2, $3, $4, $5, $6) 
    RETURNING *
`,
    [url, text, userId, title, image, description]
  );

  if (!result[0].description) {
    return;
  }
  const hashtags = getHashtagsIds(result[0].description);
  const postId = result[0].id;
  await insertHashtags(hashtags, postId);
}

async function fetchPosts() {
  return connection.query(`
        SELECT posts.*, users."imageProfile", users.name
        FROM posts JOIN users ON posts."userId" = users.id
        ORDER BY "createdAt" DESC 
        LIMIT 20
    `);
}

async function insertHashtags(hashtags, postId) {
  hashtags.map(async (hashtag) => {
    const { rows: hashtagOnDB } = await connection.query(
      `
            SELECT * FROM hashtags 
            WHERE name = $1
        `,
      [hashtag.toLowerCase()]
    );

    if (hashtagOnDB[0]) {
      await connection.query(
        `
                INSERT INTO hashtagsposts ("postId", "hashtagId") 
                VALUES ($1, $2)
            `,
        [postId, hashtagOnDB[0].id]
      );
    } else {
      const { rows: result } = await connection.query(
        `
                INSERT INTO hashtags (name) 
                VALUES ($1)
                RETURNING *
            `,
        [hashtag.toLowerCase()]
      );

      await connection.query(
        `
            INSERT INTO hashtagsposts ("postId", "hashtagId") 
            VALUES ($1, $2)
        `,
        [postId, result[0].id]
      );
    }
  });
}

async function getTrending() {
  const { rows: trending } =
    await connection.query(`SELECT h.id, COUNT("postId") as quantPosts, h.name as tag FROM hashtagsposts
    JOIN hashtags h
    ON h.id = "hashtagId"
    GROUP BY "hashtagId", h.name, h.id
    ORDER BY quantposts DESC
    LIMIT 10
    `);

  return trending;
}

async function getPostsByHashtagName(name) {
  const { rows: posts } = await connection.query(
    `SELECT p.*, users.name as name, users."imageProfile"

    FROM hashtagsposts h
    JOIN posts p
    ON p.id = h."postId"
    JOIN hashtags ht
    ON ht.id = h."hashtagId"
    JOIN users
    ON users.id = "userId"
    WHERE ht.name = $1 
    ORDER BY p."createdAt" DESC`,
    [name]
  );

  return posts;
}

async function getPostsByUserId(userId) {
  const { rows: posts } = await connection.query(
    `SELECT posts.*, users.name as name, users."imageProfile"
    FROM posts
    JOIN users
    ON posts."userId" = users.id
    WHERE posts."userId" = $1
    ORDER BY posts."createdAt" DESC`,
    [userId]
  );
  return posts;
}

async function deleteHashtagsPosts(postId) {
  return connection.query(
    `
        DELETE FROM hashtagsposts 
        WHERE "postId" = $1;
    `,
    [postId]
  );
}

async function updatePostById(text, postId) {
  return connection.query(
    `
        UPDATE posts 
        SET description = $1 
        WHERE id = $2;
    `,
    [text, postId]
  );
}

const postsRepository = {
  publishUrl,
  fetchPosts,
  insertHashtags,
  getTrending,
  getPostsByHashtagName,
  deleteHashtagsPosts,
  updatePostById,
  getPostsByUserId,
};

export default postsRepository;
