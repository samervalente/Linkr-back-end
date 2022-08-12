import { Router } from "express";
import tokenValidator from "../middlewares/tokenValidator.js";
import { getRandomUsers, getUser } from "../controllers/usersController.js";

const router = Router();

router.get("/users", getRandomUsers);
router.get("/find/:id", getUser);

export default router;
