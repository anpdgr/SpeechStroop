import { ObjectId } from 'mongodb'
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
    email: {
      type: String,
      required: true,
    },
    hnId: {
      //TODO: TBD
      type: String,
      required: false,
    },
    lastFourId: {
      type: String,
      required: true,
    },
    dateOfBirth: {
      type: Date,
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
    historyId: {
      type: [ObjectId],
      required: false,
    },
    badge: {
      type: [ObjectId],
      required: false,
    },
    preconditionId: {
      type: ObjectId,
      required: false,
    },
    healthScores: {
      stress: {
        type: Number,
        required: true,
      },
      sleep: {
        type: Number,
        required: true,
      },
    },
  },
  { timestamps: true },
)

export type UserDocument = mongoose.Document & {
  tel: string
  password: string
  name: string
  email: string
  hnId: string
  lastFourId: string
  dateOfBirth: Date
  gender: string
  education: string
  historyId: [ObjectId]
  badge: [ObjectId]
  preconditionId: [ObjectId]
  healthScores: {
    stress: number
    sleep: number
  }
  createdAt: Date
  updatedAt: Date
}

// const User = mongoose.model('User', userSchema)
const User = mongoose.model<UserDocument>('User', userSchema)

export { User }
