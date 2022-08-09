import postsRepository from '../repositories/postsRepository.js';

export async function publishPost(req, res) {
    const { url, text } = req.body;
    const userId = res.locals.userId;
    try {
        await postsRepository.publishUrl(url, text, userId);
        return res.sendStatus(201);

    } catch (error) {
        return res.status(500).send(error);
    }
}