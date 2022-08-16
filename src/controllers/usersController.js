import usersRepository from "../repository/usersRepository.js";

export async function getUsers(req, res) {
  const { name, id } = req.query;
  
  try {
    const users = await usersRepository.SearchUsers(name,id);
    return res.status(200).send(users);
  } catch (error) {
    console.log(error);
    res.status(500).send(error);
  }
}

export async function getUserById(req, res) {
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

export async function followUser(req, res){
  const {userId, followedId} = req.body
  const {action} = req.query
  try {
    if(action === 'status'){
      const status = await usersRepository.getFollowStatus(userId, followedId)
      return res.status(200).send(status)
    }

    if(userId){
      await usersRepository.followUser(userId, followedId, action)
      res.sendStatus(200)
    }
    
  } catch (error) {
    console.log(error)
    res.status(500).send(error)
  }
}


