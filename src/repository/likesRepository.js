import connection from "../database/postgre.js";

async function getPost(param) {
  return connection.query(
    ` 
      SELECT * FROM posts WHERE id = $1
    `,
    [param]
  );
}

async function publishLike(userId, postId) {
  return connection.query(
    ` 
      INSERT INTO likes ("userId","postId") VALUES ($1, $2)
    `,
    [userId, postId]
  );
}

async function getLikes(param, userId) {
  return connection.query(
    ` 
      SELECT * FROM likes WHERE "postId" = $1 AND "userId" = $2
    `,
    [param, userId]
  );
}

async function deleteLike(param, userId) {
  return connection.query(
    ` 
      DELETE FROM likes WHERE "postId"= $1 AND "userId" = $2
    `,
    [param, userId]
  );
}

async function getCountLikes(param) {
  return connection.query(
    ` 
      SELECT COUNT(id) FROM likes
      WHERE "postId" = $1
    `,
    [param]
  );
}

async function getNames(param, userId) {
  return connection.query(
    `
       SELECT users.name FROM likes 
       JOIN users
       ON likes."userId" = users.id
       WHERE likes."postId" = $1 AND likes."userId" != $2
       LIMIT 2
    `,
    [param, userId]
  );
}

const likesRepository = {
  getPost,
  getLikes,
  deleteLike,
  publishLike,
  getCountLikes,
  getNames,
};

export default likesRepository;
