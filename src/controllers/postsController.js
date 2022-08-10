import postsRepository from '../repository/postsRepository.js';

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

export async function fetchPosts(req,res){
    try{
        const posts = await postsRepository.fetchPosts();
        return res.send(posts.rows).status(200);

    }catch(err){
        console.log(err)
        res.sendStatus(500);
    }
}