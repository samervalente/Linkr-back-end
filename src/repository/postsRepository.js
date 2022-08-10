import connection from '../database/postgre.js';

async function publishUrl(url, text, userId) {
    return connection.query(` 
        INSERT INTO posts (url, description, "userId")
        VALUES ($1, $2, $3)
    `, [url, text, userId])
}

async function fetchPosts(){
    return connection.query(`
        SELECT posts.*, users."imageProfile", users.name
        FROM posts JOIN users ON posts."userId" = users.id
        ORDER BY "createdAt" DESC 
        LIMIT 20
    `)
}

const postsRepository = {
    publishUrl, 
    fetchPosts
}



export default postsRepository;

