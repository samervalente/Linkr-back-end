import connection from "../database/postgre.js";

async function publishComment(comment, postId, userId) {
    await connection.query(` 
        INSERT INTO comments (content, "postId", "userId") 
        VALUES ($1, $2, $3) 
    `, [comment, postId, userId]);
}

const commentsRepository = {
    publishComment
};

export default commentsRepository;