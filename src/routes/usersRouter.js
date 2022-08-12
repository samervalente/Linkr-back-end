import { Router } from "express";
import tokenValidator from '../middlewares/tokenValidator.js';
import { getRandomUsers } from "../controllers/usersController.js";

const router = Router();

router.get("/users", getRandomUsers )

export default router