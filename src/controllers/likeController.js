import likesRepository from "../repository/likesRepository.js";

export async function publishLike(req, res) {
  const { postId } = req.body;

  const userId = res.locals.userId;
  try {
    await likesRepository.publishLike(userId, postId);
    return res.sendStatus(201);
  } catch (error) {
    console.log(error);
    return res.status(500).send(error);
  }
}

//export async function fetchPosts(req, res) {
// try {
//  const posts = await postsRepository.fetchPosts();
//  return res.send(posts.rows).status(200);
//} catch (err) {
//   res.sendStatus(500);
//}
//}
