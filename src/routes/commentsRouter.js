import { Router } from "express";
import tokenValidator from "../middlewares/tokenValidator.js";
import validateSchema from "../middlewares/schemaValidator.js";
import commentSchema from "../schemas/commentSchema.js";
import { commentPost, getCommentsById } from "../controllers/commentsController.js";

const router = Router();

router.post("/comments/:id", tokenValidator, validateSchema(commentSchema), commentPost);
router.get("/comments/:id", tokenValidator, getCommentsById);

export default router;