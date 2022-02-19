import { ObjectId } from 'mongodb'
import { History, HistoryDocument } from 'src/model/history'
import { UserDocument } from 'src/model/user'

export interface HistoryDTO {
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

export async function setHistory(
  historyDTO: HistoryDTO,
  userId: ObjectId,
): Promise<HistoryDocument> {
  const newHistory = new History({
    userId: userId,
    totalScore: historyDTO.totalScore,
    section: historyDTO.section,
    healthScores: historyDTO.healthScores,
    badge: historyDTO.badge,
  })

  await newHistory.save()
  return newHistory
}
