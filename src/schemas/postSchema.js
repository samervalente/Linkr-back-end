import joi from 'joi';

const postSchema = joi.object({
  url: joi.string().uri().required(),
  text: joi.string()
})

export default postSchema;