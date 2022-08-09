import { Router } from 'express';

import tokenValidator from '../middlewares/tokenValidator.js';
import postSchema from '../schemas/postSchema.js';
import { schemaValidator } from '../middlewares/schemaValidator.js';
import { publishPost } from '../controllers/postsController.js';

const router = Router();

router.post('/posts', tokenValidator, schemaValidator(postSchema), publishPost);

export default router;