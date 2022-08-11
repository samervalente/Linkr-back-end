import { Router } from "express";
import authRouter from "./authRouter.js";
import loginRouter from "./loginRouter.js";
import postsRouter from "./postsRouter.js";
import likesRouter from "./likesRouter.js";

const routes = Router();

routes.use(authRouter);
routes.use(loginRouter);
routes.use(postsRouter);
routes.use(likesRouter);

export default routes;
