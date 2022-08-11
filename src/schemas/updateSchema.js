import joi from 'joi';

const updateSchema = joi.object({
  text: joi.string()
})

export default updateSchema;