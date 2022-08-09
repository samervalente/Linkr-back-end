import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import routes from "./routes/index.js";

dotenv.config();

const app = express();
app.use([cors(), express.json()]);

app.use(routes);

const PORT = process.env.PORT;

app.listen(PORT, () => {
  console.log(`Servidor funcionando na porta ${PORT}`);
});
