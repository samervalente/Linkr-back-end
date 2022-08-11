import { Router } from "express";
import tokenValidator from "../middlewares/tokenValidator.js";
import validateSchema from "../middlewares/schemaValidator.js";
import likeSchema from "../schemas/likeSchema.js";
import {
  deleteLikes,
  getLikes,
  publishLike,
} from "../controllers/likeController.js";
import { validateParam } from "../middlewares/likesMiddleware.js";

const router = Router();

router.post("/likes", tokenValidator, validateSchema(likeSchema), publishLike);
router.get("/likes/:id", tokenValidator, validateParam, getLikes); //id do post
router.delete("/likes/:id", tokenValidator, validateParam, deleteLikes);

export default router;
