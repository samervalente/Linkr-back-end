import { Router } from "express";
import tokenValidator from "../middlewares/tokenValidator.js";
import validateSchema from "../middlewares/schemaValidator.js";
import likeSchema from "../schemas/likeSchema.js";
import { publishLike } from "../controllers/likeController.js";

const router = Router();

router.post("/likes", tokenValidator, validateSchema(likeSchema), publishLike);

export default router;
