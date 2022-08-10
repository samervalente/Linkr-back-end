import { Router } from 'express';

import tokenValidator from '../middlewares/tokenValidator.js';
import postSchema from '../schemas/postSchema.js';
import validateSchema from "../middlewares/schemaValidator.js";
import { fetchPosts, publishPost } from '../controllers/postsController.js';

const router = Router();

router.post('/posts', tokenValidator, validateSchema(postSchema), publishPost);
router.get('/posts', tokenValidator, fetchPosts)

export default router;