import { Router } from "express";

import tokenValidator from "../middlewares/tokenValidator.js";
import postSchema from "../schemas/postSchema.js";
import updateSchema from "../schemas/updateSchema.js";
import validateSchema from "../middlewares/schemaValidator.js";
import {
  fetchPosts,
  publishPost,
  getTrending,
  getPostsByHashtag,
  updatePost,
  getPostsByUserId,
  deletePost,
  countPosts,
  setRepost
} from "../controllers/postsController.js";

const router = Router();

router.post("/posts", tokenValidator, validateSchema(postSchema), publishPost);
router.get("/posts", tokenValidator, fetchPosts);
router.get("/trending", getTrending);
router.put("/posts/:id",tokenValidator,validateSchema(updateSchema),updatePost);
router.get("/posts/:hashtagName", tokenValidator, getPostsByHashtag);
router.get("/user/posts/:id", tokenValidator, getPostsByUserId);
router.delete("/posts/:id", tokenValidator, deletePost);
router.get("/postscount", tokenValidator, countPosts);
router.post("/reposts/:id", tokenValidator, setRepost)

export default router;
