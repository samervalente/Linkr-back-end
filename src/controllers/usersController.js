import usersRepository from "../repository/usersRepository.js";

export async function getRandomUsers(req, res) {
  const { name } = req.query;
  try {
    const users = await usersRepository.SearchUsers(name);
    return res.status(200).send(users);
  } catch (error) {
    console.log(error);
    res.status(500).send(error);
  }
}

export async function getUser(req, res) {
  const { id } = req.params;
  try {
    const users = await usersRepository.FindUser(id);
    if (users.length === 0) {
      return res.status(404).send();
    }
    return res.status(200).send(users[0]);
  } catch (error) {
    console.log(error);
    res.status(500).send(error);
  }
}
