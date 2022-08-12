import { Router } from "express";
import {RegisterSchema} from "../schemas/authSchema.js"
import validateSchema from "../middlewares/schemaValidator.js";
import { validateUserExistence } from "../middlewares/authValidator.js";
import {checkToken, RegisterUser} from "../controllers/authController.js"
import tokenValidator from "../middlewares/tokenValidator.js";

const route = Router()

route.post('/signup', validateSchema(RegisterSchema), validateUserExistence, RegisterUser);
route.post('/auth/validate', tokenValidator, checkToken);

export default route;