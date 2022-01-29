import { Request } from 'express'
import { UserDocument } from 'src/users/schema'

export type RequestWithUser = Request & {
  user: UserDocument
}
