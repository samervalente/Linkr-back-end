import bcrypt from "bcrypt";
import connection from "../database/postgre.js";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

export async function loginUser(req, res) {
  dotenv.config();
  const user = req.body;

  const { rows: inPostgres } = await connection.query(
    `SELECT * FROM users WHERE email = $1`,
    [user.email]
  );

  if (
    inPostgres.length > 0 &&
    bcrypt.compareSync(user.password, inPostgres[0].password)
  ) {
    const data = inPostgres[0].id;
    const secret = process.env.JWT_SECRET;
    //const config = { expiresIn: 2592000 };

    const token = jwt.sign(data, secret);
    const imageProfile = inPostgres[0].imageProfile;
    const userId = inPostgres[0].id
    res.status(200).send({ token, imageProfile, userId });
  } else {
    res.status(401).send();
  }
}
