import express from "express";
import cors from "cors";
import dotenv from "dotenv";

import loginRouter from "./routes/loginRouter.js";

dotenv.config();
const app = express();
app.use([cors(), express.json()]);

app.use(loginRouter);

const PORT = process.env.PORT;

app.listen(PORT, () => {
  console.log(`Servidor funcionando na porta ${PORT}`);
});
