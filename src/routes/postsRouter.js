import { Router } from 'express';

import tokenValidator from '../middlewares/tokenValidator.js';
import postSchema from '../schemas/postSchema.js';
import validateSchema from "../middlewares/schemaValidator.js";
import { publishPost } from '../controllers/postsController.js';

const router = Router();

router.post('/posts', tokenValidator, validateSchema(postSchema), publishPost);

export default router;