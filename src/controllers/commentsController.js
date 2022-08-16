import commentsRepository from "../repository/commentsRepository.js";

export async function commentPost(req, res) {
    const { comment } = req.body;
    const { id: postId } = req.params;
    const userId = res.locals.userId;
    try {
        await commentsRepository.publishComment(comment, postId, userId);
        return res.sendStatus(201);
    } catch (error) {
        return res.status(500).send(error);
    }
}