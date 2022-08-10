import postsRepository from '../repository/postsRepository.js';
import urlMetadata from 'url-metadata';

export async function publishPost(req, res) {
    const { url, text } = req.body;

    const userId = res.locals.userId;
    try {
        const metadata = await urlMetadata(url);
        const { title, image, description } = metadata;
        
        await postsRepository.publishUrl(url, text, userId, title, image, description);
        return res.sendStatus(201);

    } catch (error) {
        console.log(error)
        return res.status(500).send(error);
    }
}

export async function fetchPosts(req,res){
    try{
        const posts = await postsRepository.fetchPosts();
        return res.send(posts.rows).status(200);

    }catch(err){
        
        res.sendStatus(500);
    }
}

export async function getTrending(req, res){
    try {
        const trending = await postsRepository.getTrending();
        res.status(200).send(trending)
    } catch (error) {
        res.sendStatus(500)
    }
}