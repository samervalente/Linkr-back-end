import connection from '../database/postgre.js';
import getHashtagsIds from "../utils/getHashtagIds.js";

async function publishUrl(url, text, userId, title, image, description) {
    const ids = [];
    const {rows: result} = await connection.query(` 
        INSERT INTO posts (url, description, "userId", "urlTitle", "urlImage", "urlDescription") 
        VALUES ($1, $2, $3, $4, $5, $6) 
        RETURNING *
    `, [url, text, userId, title, image, description]);
    
    if (!result[0].description) {
        console.log("sem descrição");
        return
    }

    const hashtags= getHashtagsIds(result[0].description);

    await insertHashtags(hashtags);

        for(const hashtag of hashtags){
            const {rows: id} = await connection.query(`SELECT hashtags.id, hashtags.name FROM hashtags WHERE name = $1`,[hashtag.toLowerCase()])
            ids.push(id[0])
        }
            if(ids.length > 0){
                const postId = result[0].id
               
                ids.map(async obj => {
                await connection.query(`INSERT INTO hashtagsposts ("postId", "hashtagId") VALUES ($1, $2)`,[postId, obj.id])
            })
        }
}

async function fetchPosts(){
    return connection.query(`
        SELECT posts.*, users."imageProfile", users.name
        FROM posts JOIN users ON posts."userId" = users.id
        ORDER BY "createdAt" DESC 
        LIMIT 20
    `)
}


async function insertHashtags(hashtags){
    hashtags.map(async hashtag => {
        const {rows: hashtagOnDB} = await connection.query(`SELECT * FROM hashtags WHERE name = $1`,
        [hashtag.toLowerCase()])
        hashtagOnDB.length === 0 ? await connection.query(`INSERT INTO hashtags (name) VALUES ($1)`,
        [hashtag.toLowerCase()]): null
    }) 
}

async function getTrending(){
    const {rows: trending} = await connection.query(`SELECT COUNT("postId") as quantPosts, h.name as tag FROM hashtagsposts
    JOIN hashtags h
    ON h.id = "hashtagId"
    GROUP BY "hashtagId", h.name
    ORDER BY quantposts DESC`)

    return trending
}

const postsRepository = {
    publishUrl, 
    fetchPosts,
    getTrending
}


export default postsRepository;

