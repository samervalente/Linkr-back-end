import { Router } from "express";
import authRouter from "./authRouter.js";
import loginRouter from "./loginRouter.js";

const routes = Router();

routes.use(authRouter);
routes.use(loginRouter);

export default routes;
