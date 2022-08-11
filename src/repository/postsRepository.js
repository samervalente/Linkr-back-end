import connection from '../database/postgre.js';
import getHashtagsIds from "../utils/getHashtagIds.js"

async function publishUrl(url, text, userId) {
    const ids = []
    const {rows: result} = await connection.query(` INSERT INTO posts (url, description, "userId") VALUES 
    ($1, $2, $3) RETURNING *`, [url, text, userId])
  
    const hashtags = getHashtagsIds(result[0].description)
    const postId = result[0].id
    await insertHashtags(hashtags)
   
          await hashtags.map(async hashtag => {
           const {rows: id} = await connection.query(`SELECT hashtags.id, hashtags.name FROM hashtags WHERE name = $1`,[hashtag.toLowerCase()])

           await connection.query(`INSERT INTO hashtagsposts ("postId", "hashtagId") VALUES ($1, $2)`,[postId, id[0].id])
          
        })
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
        hashtagOnDB.length === 0? await connection.query(`INSERT INTO hashtags  (name) VALUES ($1)`,
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

