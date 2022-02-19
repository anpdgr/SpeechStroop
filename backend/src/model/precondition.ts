import { ObjectId } from 'mongodb'
import mongoose from 'mongoose'
const Schema = mongoose.Schema

const preconditionSchema = new Schema(
  {
    userId: {
      type: ObjectId,
      required: true,
    },
    isColorBlind: {
      type: Boolean,
      required: true,
    },
    colorVisibilityTest: {
      score: Number,
      date: Date
    },
    readingAbilityTest: {
      score: Number,
      date: Date
    },
    isPassAll: {
      type: Boolean,
      required: true
    }
  },
  { timestamps: true },
)

export type PreconditionDocument = mongoose.Document & {
  userId: ObjectId,
  isColorBlind: Boolean,
  colorVisibilityTest: {
    score: Number,
    date: Date
  },
  readingAbilityTest: {
    score: Number,
    date: Date
  },
  isPassAll: Boolean
}


const Precondition = mongoose.model('Precondition', preconditionSchema)

export { Precondition }
