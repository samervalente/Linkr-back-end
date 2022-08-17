import { Router } from "express";
import tokenValidator from "../middlewares/tokenValidator.js";
import {
  getUsers,
  getUserById,
  followUser,
} from "../controllers/usersController.js";

const router = Router();

router.get("/users", tokenValidator, getUsers);
router.get("/find/:id", getUserById);
router.post("/users/follow", followUser);

export default router;
