import mongoose from 'mongoose'
const Schema = mongoose.Schema

const badgeSchema = new Schema(
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
  },
  { timestamps: true },
)

export type BadgeDocument = mongoose.Document & {
  tel: string
  password: string
  name: string
  email: string
}

const Badge = mongoose.model('User', badgeSchema)

export { Badge }
