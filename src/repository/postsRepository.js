import connection from '../database/postgre.js';

async function publishUrl(url, text, userId) {
    return connection.query(` 
        INSERT INTO posts (url, description, "userId")
        VALUES ($1, $2, $3)
    `, [url, text, userId])
}

const postsRepository = {
    publishUrl
}

export default postsRepository;