import cors from 'cors'
import express from 'express'
import mongoose from 'mongoose'
import { MONGO_URI, PORT } from './config'
import { errorHandler } from './errors'
import authRouter from './routes/auth'
import passportRouter from './routes/passport'
import uploadRouter from './routes/upload'
import userRouter from './routes/user'

const app = express()

app.use(cors())

app.get('/', (req, res) => {
  res.status(200).send('Hello, World!')
})

app.use('/auth', authRouter)

app.use(passportRouter)

// use token to access
app.use('/user', userRouter)
app.use('/upload', uploadRouter)

// Error handling
app.use(errorHandler)

console.log(`Connecting to MongoDB...`)
mongoose
  .connect(MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then((result) => {
    app.listen(PORT, () =>
      console.log(`Connected! App running on port ${PORT}`),
    )
  })
  .catch((err) => {
    console.log(err)
  })
