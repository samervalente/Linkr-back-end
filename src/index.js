import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import postsRouter from './routes/postsRouter.js';

dotenv.config();

const app = express();
app.use([cors(), express.json()]);

app.use(postsRouter);

app.listen(process.env.PORT);