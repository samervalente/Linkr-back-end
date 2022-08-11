import connection from '../database/postgre.js';

async function getUserById(userId) {
    return connection.query(` 
        SELECT * FROM users WHERE id = $1
    `, [userId])
}

async function checkPostByUserId(postId, userId) {
    return connection.query(`
        SELECT posts.* FROM posts 
        JOIN users 
        ON posts."userId" = users.id 
        WHERE posts.id = $1 AND users.id = $2
    `, [postId, userId]);
}

const usersRepository = {
    getUserById,
    checkPostByUserId
}

export default usersRepository;