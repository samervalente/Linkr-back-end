import express from "express"
import cors from "cors"
import routes from "./routes/index.js"

const app = express()
app.use([cors(), express.json()])
app.use(routes)

app.listen(process.env.PORT)