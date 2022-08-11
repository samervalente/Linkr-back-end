import postsRepository from '../repository/postsRepository.js';
import usersRepository from '../repository/usersRepository.js';
import getHashtagsIds from "../utils/getHashtagIds.js";
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

export async function getPostsByHashtag(req,res){
    const {hashtagName} = req.params
    try {
        const posts = await postsRepository.getPostsByHashtagName(hashtagName)
        res.status(200).send(posts)
    } catch (error) {
        res.sendStatus(500)
    }
}

export async function updatePost(req, res) {
    const userId = res.locals.userId;
    const { text } = req.body;
    const { id: postId } = req.params;
    try {
        //conferir se o post é do usuário
        const result = await usersRepository.checkPostByUserId(postId, userId);
        if (!result.rowCount) {
            return res.status(401).send('Esse post não pertence ao usuário logado');
        }

        //apagar relação hashtagsposts
        await postsRepository.deleteHashtagsPosts(postId);

        //atualizar posts
        await postsRepository.updatePostById(text, postId);

        //inserir relações hashtagsposts novamente
        if(text) {
            const hashtags = getHashtagsIds(text);
            await postsRepository.insertHashtags(hashtags, postId);
            return res.sendStatus(200);
        }
        return res.sendStatus(200);

    } catch (error) {
        res.sendStatus(500);
    }
}