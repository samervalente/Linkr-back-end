import { Router } from 'express';

import tokenValidator from '../middlewares/tokenValidator.js';
import postSchema from '../schemas/postSchema.js';
import updateSchema from '../schemas/updateSchema.js';
import validateSchema from "../middlewares/schemaValidator.js";
import { fetchPosts, publishPost, getTrending, getPostsByHashtag, updatePost, deletePost } from '../controllers/postsController.js';

const router = Router();

router.post('/posts', tokenValidator, validateSchema(postSchema), publishPost);
router.get('/posts', tokenValidator, fetchPosts);
router.get("/trending", getTrending);
router.put('/posts/:id', tokenValidator, validateSchema(updateSchema), updatePost);
router.get("/posts/:hashtagName", tokenValidator, getPostsByHashtag);
router.delete("/posts/:id", deletePost)

export default router;

