import { ObjectId } from 'mongodb'
import mongoose from 'mongoose'
const Schema = mongoose.Schema

const historySchema = new Schema(
  {
    userId: {
      type: ObjectId,
      required: true,
    },
    totalScore: {
      type: Number,
      required: true,
    },
    sections: [
      {
        section: Number,
        score: {
          congruent: Number,
          incrongruent: Number,
        },
        avgReactionTimeMs: Number,
        questions: [
          {
            questionNumber: Number,
            problem: {
              color: String,
              word: String,
            },
            condition: String,
            expectedAnswer: String,
            userAnswer: String,
            startAt: Date,
            answerAt: Date,
            reactionTimeMs: Number,
          },
        ],
        audioUrl: String,
      },
    ],
    healthScores: {
      stress: {
        start: Number,
        break1: Number,
        break2: Number,
        end: Number,
      },
      awake: {
        start: Number,
        break1: Number,
        break2: Number,
        end: Number,
      },
    },
    badge: {
      type: [ObjectId],
      required: false,
    },
  },
  { timestamps: true },
)

export type HistoryDocument = mongoose.Document & {
  userId: ObjectId
  totalScore: string
  section: [
    {
      section: number
      score: {
        congruent: number
        incrongruent: number
      }
      avgReactionTimeMs: number
      questions: [
        {
          questionNumber: number
          problem: {
            color: string
            word: string
          }
          condition: string
          expectedAnswer: string
          userAnswer: string
          startAt: Date
          answerAt: Date
          reactionTimeMs: number
        },
      ]
      audioUrl: string
    },
  ]
  healthScores: {
    stress: {
      start: number
      break: number
      end: number
    }
    awake: {
      start: number
      break: number
      end: number
    }
  }
  badge: {
    type: [ObjectId]
    required: false
  }
}

const History = mongoose.model<HistoryDocument>('History', historySchema)

export { History }
