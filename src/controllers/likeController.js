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

export async function getLikes(req, res) {
  const param = req.params.id;
  const userId = res.locals.userId;
  try {
    const like = await likesRepository.getLikes(param, userId);
    return res.status(200).send(like.rows[0]);
  } catch (err) {
    res.sendStatus(500);
  }
}

export async function deleteLikes(req, res) {
  const param = req.params.id;
  const userId = res.locals.userId;
  try {
    await likesRepository.deleteLike(param, userId);
    return res.status(200).send();
  } catch (err) {
    res.sendStatus(500);
  }
}

export async function getCountLikes(req, res) {
  const param = req.params.id;
  try {
    const { rows: count } = await likesRepository.getCountLikes(param);
    return res.status(200).send(count[0]);
  } catch (err) {
    res.status(500).send(err);
  }
}

export async function getNames(req, res) {
  const param = req.params.id;
  try {
    const { rows: names } = await likesRepository.getNames(param);
    return res.status(200).send(names);
  } catch (err) {
    res.status(500).send(err);
  }
}
