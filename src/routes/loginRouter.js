import { Router } from "express";

import { validateSignIn } from "../middlewares/loginMiddleware.js";
import { loginUser } from "../controllers/loginController.js";

const router = Router();

router.post("/signin", validateSignIn, loginUser);

export default router;
