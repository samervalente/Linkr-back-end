import { Router } from "express";
import tokenValidator from "../middlewares/tokenValidator.js";
import validateSchema from "../middlewares/schemaValidator.js";
import likeSchema from "../schemas/likeSchema.js";
import {
  deleteLikes,
  getCountLikes,
  getLikes,
  getNames,
  publishLike,
} from "../controllers/likeController.js";
import { validateParam } from "../middlewares/likesMiddleware.js";

const router = Router();

router.post("/likes", tokenValidator, validateSchema(likeSchema), publishLike);
router.get("/likes/:id", tokenValidator, validateParam, getLikes); //id do post
router.delete("/likes/:id", tokenValidator, validateParam, deleteLikes);
router.get("/likes/count/:id", validateParam, getCountLikes);
router.get("/likes/names/:id", tokenValidator, validateParam, getNames);

export default router;
