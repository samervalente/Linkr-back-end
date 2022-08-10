import connection from "../database/postgre.js";

async function publishLike(userId, postId) {
  return connection.query(
    ` 
        INSERT INTO likes ("postId","userId")
        VALUES ($1, $2)
    `,
    [postId, userId]
  );
}

async function fetchPosts() {
  return connection.query(`
        SELECT posts.*, users."imageProfile", users.name
        FROM posts JOIN users ON posts."userId" = users.id
        ORDER BY "createdAt" DESC 
        LIMIT 20
    `);
}

async function insertHashtags(hashtags) {
  hashtags.map(async (hashtag) => {
    const { rows: hashtagOnDB } = await connection.query(
      `SELECT * FROM hashtags WHERE name = $1`,
      [hashtag.toLowerCase()]
    );
    hashtagOnDB.length === 0
      ? await connection.query(`INSERT INTO hashtags  (name) VALUES ($1)`, [
          hashtag.toLowerCase(),
        ])
      : null;
  });
}

const postsRepository = {
  publishLike,
  fetchPosts,
  insertHashtags,
};

export default postsRepository;
