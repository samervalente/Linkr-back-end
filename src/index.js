import express from "express"
import cors from "cors"

const app = express()
app.use([cors(), express.json()])


app.listen(process.env.PORT)