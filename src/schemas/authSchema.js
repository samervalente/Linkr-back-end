import joi from "joi"

const RegisterSchema = joi.object({
    name: joi.string().required(),
    email: joi.string().email().pattern(/^[a-z0-9.!#]{2,30}@[a-z0-9]{3,15}(.[a-z]{1,5}){1,5}$/).required(),
    imageProfile:joi.string().pattern(/^http[^\?]*.(jpg|jpeg|gif|png|tiff|bmp)(\?(.*))?$/im).required(),
    password: joi.string().alphanum().required(),
    confirmPassword: joi.string().alphanum().valid(joi.ref('password'))
})

export {RegisterSchema}