import connection from "../database/postgre.js";

async function getUserById(userId) {
  return connection.query(
    ` 
        SELECT * FROM users WHERE id = $1
    `,
    [userId]
  );
}

async function checkPostByUserId(postId, userId) {
  return connection.query(
    `
        SELECT posts.* FROM posts 
        JOIN users 
        ON posts."userId" = users.id 
        WHERE posts.id = $1 AND users.id = $2
    `,
    [postId, userId]
  );
}

async function SearchUsers(userName) {
  const { rows: users } =
    await connection.query(`SELECT id, name, "imageProfile" FROM users WHERE name ILIKE '${userName}%'
    ORDER BY name ASC    
    LIMIT 2`);
  return users;
}

async function FindUser(id) {
  const { rows: users } = await connection.query(
    `SELECT users.name FROM users WHERE id = $1`,
    [id]
  );
  return users;
}

const usersRepository = {
  getUserById,
  checkPostByUserId,
  SearchUsers,
  FindUser,
};

export default usersRepository;
