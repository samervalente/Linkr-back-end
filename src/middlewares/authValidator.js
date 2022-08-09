import {queryUserByEmail} from "../repository/authRepository.js"


export async function validateUserExistence(req, res, next){
    const {email} = req.body
    try {
        const user = await queryUserByEmail(email)
        
        if(user !== undefined){
            return res.status(409).send("User already exist")
        }
        next()

    } catch (error) {
        console.log(error)
        res.status(500).send(error)
    }
}