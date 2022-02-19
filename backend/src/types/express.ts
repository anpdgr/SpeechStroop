import { Request } from 'express'
import { UserDocument } from 'src/model/user'

export type RequestWithUser = Request & {
  user: UserDocument
}
