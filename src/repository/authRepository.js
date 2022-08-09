import connection from "../database/postgre.js"

 export async function queryUserByEmail(email){
    const {rows: user} = await connection.query(`SELECT (email) FROM users WHERE email = $1`, [email])
   
    return user
}

export async function insertUserOnDB(name, email, password, imageProfile){
    await connection.query(`INSERT INTO users (name, email, password, "imageProfile") 
    VALUES ($1,$2,$3,$4)`,[name,email,password, imageProfile])
}