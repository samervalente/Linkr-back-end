import connection from "../database/postgre.js";

async function publishComment(comment, postId, userId) {
    await connection.query(` 
        INSERT INTO comments (content, "postId", "userId") 
        VALUES ($1, $2, $3) 
    `, [comment, postId, userId]);
}

async function fetchComments(postId) {
    return await connection.query(` 
        SELECT c.id, c.content, p.id AS "postId", u.id AS "userId", u.name, u."imageProfile" 
        FROM comments c 
        JOIN posts p 
        ON c."postId" = p.id 
        JOIN users u 
        ON c."userId" = u.id 
        WHERE c."postId" = $1
        ORDER BY c."createdAt" 
    `, [postId]);
}

const commentsRepository = {
    publishComment,
    fetchComments
};

export default commentsRepository;