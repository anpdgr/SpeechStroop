import { Request } from 'express'
import { HistoryDTO } from 'src/controller/set_history'
import { UserDocument } from 'src/model/user'

export type RequestWithUser = Request & {
  user: UserDocument
}
