import mongoose from 'mongoose'
const Schema = mongoose.Schema

const userSchema = new Schema(
  {
    tel: {
      type: String,
      required: true,
    },
    password: {
      type: String,
      required: true,
    },
    name: {
      type: String,
      required: true,
    },
    lastFourId: {
      type: Number,
      required: true,
    },
    age: {
      type: Number,
      required: true,
    },
    gender: {
      type: String,
      required: true,
    },
    education: {
      type: String,
      required: true,
    },
    isColorBlind: {
      type: Boolean,
      required: true,
    },
    stress: {
      type: Number,
      required: true,
    },
    sleep: {
      type: Number,
      required: true,
    },
  },
  { timestamps: true },
)

export type UserDocument = mongoose.Document & {
  tel: string
  password: string
  name: string
  email: string
  lastFourId: number
  age: number
  gender: string
  education: string
  isColorBlind: boolean
  stress: number
  sleep: number
  createdAt: Date
  updatedAt: Date
}

const User = mongoose.model<UserDocument>('User', userSchema)

export { User }
