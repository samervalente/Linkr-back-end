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

// async function fetchPosts() {
//   return connection.query(`
//         SELECT posts.*, users."imageProfile", users.name
//         FROM posts JOIN users ON posts."userId" = users.id
//         ORDER BY "createdAt" DESC 
//         LIMIT 20
//     `);
// }

async function fetchPosts(userId, offset) {
  return connection.query(`
    SELECT posts.id, posts.url, posts."userId", posts.description, posts."urlTitle", posts."urlImage", posts."urlDescription", reposts."createdAt", users."imageProfile", users.name, reposts."userId" AS "reposterId", reposters.name AS "reposterName"
    FROM reposts
    JOIN posts
    ON reposts."postId" = posts.id
    JOIN users
    ON posts."userId" = users.id
    JOIN users "reposters"
    ON reposters.id = reposts."userId"
    JOIN follows
    ON follows."followedId" = reposts."userId" AND follows."userId" = $1
    UNION ALL
    SELECT posts.id, posts.url, posts."userId", posts.description, posts."urlTitle", posts."urlImage", posts."urlDescription", posts."createdAt", users."imageProfile", users.name, NULL AS "reposterId" , NULL AS "reposterName"
    FROM posts 
    JOIN users 
    ON posts."userId" = users.id
    JOIN follows
    ON follows."followedId" = posts."userId" AND follows."userId" = $1
    UNION ALL
    SELECT posts.id, posts.url, posts."userId", posts.description, posts."urlTitle", posts."urlImage", posts."urlDescription", posts."createdAt", users."imageProfile", users.name, NULL AS "reposterId" , NULL AS "reposterName"
    FROM posts 
    JOIN users 
    ON posts."userId" = users.id
    WHERE "userId" = $1
    UNION ALL
    SELECT posts.id, posts.url, posts."userId", posts.description, posts."urlTitle", posts."urlImage", posts."urlDescription", reposts."createdAt", users."imageProfile", users.name, reposts."userId" AS "reposterId", reposters.name AS "reposterName"
    FROM reposts
    JOIN posts
    ON reposts."postId" = posts.id
    JOIN users
    ON posts."userId" = users.id
    JOIN users "reposters"
    ON reposters.id = reposts."userId"
    WHERE reposts."userId" = $1
    ORDER BY "createdAt" DESC
    OFFSET $2
    LIMIT 10;
    `, [userId, offset]);
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

async function getPostsByHashtagName(name, offset) {
  const { rows: posts } = await connection.query(
    `SELECT p.*, users.name as name, users."imageProfile", NULL AS "reposterId" , NULL AS "reposterName"
    FROM hashtagsposts h
    JOIN posts p
    ON p.id = h."postId"
    JOIN hashtags ht
    ON ht.id = h."hashtagId"
    JOIN users
    ON users.id = "userId"
    WHERE ht.name = $1 
    ORDER BY p."createdAt" DESC
    OFFSET $2
    LIMIT 10`,
    [name, offset]
  );

  return posts;
}

async function getPostsByUserId(userId, offset) {
  const { rows: posts } = await connection.query(`
  SELECT posts.id, posts.url, posts."userId", posts.description, posts."urlTitle", posts."urlImage", posts."urlDescription", reposts."createdAt", users."imageProfile", users.name, reposts."userId" AS "reposterId", reposters.name AS "reposterName"
  FROM reposts
  JOIN posts
  ON reposts."postId" = posts.id
  JOIN users
  ON posts."userId" = users.id
  JOIN users "reposters"
  ON reposters.id = reposts."userId"
  WHERE reposts."userId" = $1
  UNION ALL
  SELECT posts.id, posts.url, posts."userId", posts.description, posts."urlTitle", posts."urlImage", posts."urlDescription", posts."createdAt", users."imageProfile", users.name, NULL AS "reposterId" , NULL AS "reposterName"
  FROM posts 
  JOIN users 
  ON posts."userId" = users.id
  WHERE posts."userId" = $1
  ORDER BY "createdAt" DESC
  OFFSET $2
  LIMIT 10;`,
    [userId, offset]
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

async function deletePost(postId) {
  return connection.query(
    `
        DELETE FROM posts 
        WHERE id = $1;
    `,
    [postId]
  );
}

async function countPosts() {
  return connection.query(`
    SELECT COUNT("id") as count FROM posts;
  `);
}

async function setRepost(postId, userId){
  return connection.query(
    `INSERT INTO reposts ("postId", "userId" ) 
    VALUES ($1, $2)`, 
    [postId, userId]
  )
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
  deletePost,
  countPosts,
  setRepost
};

export default postsRepository;
