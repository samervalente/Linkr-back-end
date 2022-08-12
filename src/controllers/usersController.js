import usersRepository from '../repository/usersRepository.js';

export async function getRandomUsers(req, res){
     const {name} = req.query
    try {
            const users = await usersRepository.SearchUsers(name)
            return res.status(200).send(users)
        
    } catch (error) {  
        console.log(error) 
        res.status(500).send(error)
    }
}