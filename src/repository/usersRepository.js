import connection from "../database/postgre.js";

async function getUserById(userId) {
  return connection.query(
    ` 
        SELECT * FROM users WHERE id = $1
    `,
    [userId]
  );
}

async function checkPostByUserId(postId, userId) {
  return connection.query(
    `
        SELECT posts.* FROM posts 
        JOIN users 
        ON posts."userId" = users.id 
        WHERE posts.id = $1 AND users.id = $2
    `,
    [postId, userId]
  );
}


async function SearchUsers(userName, userId) {

  const {rows: followedsUsers} = await connection.query(`SELECT users.id as userId, name, follows."userId" as followedBy, "imageProfile" FROM users
  JOIN follows
  on follows."followedId" = users.id
  WHERE name ILIKE '${userName}%' AND follows."userId" = $1`,[userId])

  const { rows: unFollowedUsers } = await connection.query(`
   SELECT id as userId, name, "imageProfile" FROM users 
   WHERE id NOT IN (SELECT "followedId" FROM follows WHERE follows."userId" = $1) 
   AND name ILIKE '${userName}%'
   ORDER BY name ASC    
   LIMIT 8`,[userId])
   
  const users = mountOutput(followedsUsers, unFollowedUsers)
  return users

}

function mountOutput(lst1, lst2){
  let output = []
  output = [...lst1, ...lst2]
  return output
}


async function FindUser(id) {
  const { rows: users } = await connection.query(
    `SELECT users.name FROM users WHERE id = $1`,
    [id]
  );
  return users;
}

async function followUser(userId, followedId, type){
  userId = Number(userId)
  followedId = Number(followedId)
 
  if(type === "follow"){
    await connection.query(`INSERT INTO follows ("userId","followedId") VALUES ($1,$2)`,[userId, followedId])
  }
  else{
    await connection.query(`DELETE FROM follows WHERE "userId" = $1 AND "followedId" = $2`,[userId, followedId])
  }
}

async function getFollowStatus(userId, followedId){
  const {rows: followId} = await connection.query('SELECT * FROM follows WHERE "userId" = $1 AND "followedId" = $2',[userId, followedId])
  

  if(followId.length === 0 ){
    return false
  }else{
    return true
  }
}

const usersRepository = {
  getUserById,
  checkPostByUserId,
  SearchUsers,
  FindUser,
  followUser,
  getFollowStatus
};

export default usersRepository;
