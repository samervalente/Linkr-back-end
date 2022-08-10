import joi from 'joi';

const postSchema = joi.object({
  url: joi.string().uri().required(),
  text: joi.string(),
  hashtags:joi.array()
})

export default postSchema;