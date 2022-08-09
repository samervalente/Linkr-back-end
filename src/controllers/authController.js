import bcrypt from "bcrypt"
import {insertUserOnDB} from "../repository/authRepository.js"

export async function RegisterUser(req, res){
    const {name, email, password, imageProfile} = req.body
    const passwordCrypt = bcrypt.hashSync(password, 10)
    try {
         await insertUserOnDB(name, email, passwordCrypt, imageProfile)
         res.sendStatus(201)
    } catch (error) {
        res.status(500).send(error)
    }
}