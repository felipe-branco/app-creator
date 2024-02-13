import express from 'express'
import cors from 'cors'
import { Router, Request, Response } from 'express'

const app = express()
const route = Router()
app.use(express.json())
app.use(cors())

route.get('/', (request: Request, response: Response) => {
  response.json({ message: 'Server running!' })
})

app.use(route)
app.listen(3333, () => 'server running on port 3333')
