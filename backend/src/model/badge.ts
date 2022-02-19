import mongoose from 'mongoose'
const Schema = mongoose.Schema

const badgeSchema = new Schema(
  {
    name: {
      type: String,
      required: true,
    },
    detail: {
      type: String,
      required: true,
    },
    imgUrl: {
      type: String,
      required: true,
    },
    type: {
      type: String,
      required: true,
    },
  },
  { timestamps: true },
)

export type BadgeDocument = mongoose.Document & {
  name: string
  detail: string
  imgUrl: string
  type: string
}

const Badge = mongoose.model('Badge', badgeSchema)

export { Badge }
