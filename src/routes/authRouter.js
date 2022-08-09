import { Router } from "express";
import {RegisterSchema} from "../schemas/authSchema.js"
import validateSchema from "../middlewares/schemaValidator.js";
import { validateUserExistence } from "../middlewares/authValidator.js";
import {RegisterUser} from "../controllers/authController.js"

const route = Router()

route.post('/signup', validateSchema(RegisterSchema), validateUserExistence, RegisterUser);

export default route;