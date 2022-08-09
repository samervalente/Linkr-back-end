import connection from '../database/postgre.js';

async function getUserById(userId) {
    return connection.query(` 
        SELECT * FROM users WHERE id = $1
    `, [userId])
}


const usersRepository = {
    getUserById
}

export default usersRepository;