import { ObjectId } from 'mongodb'
import { User, UserDocument } from 'src/model/user'

export interface UpdateUserDTO {
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
  preconditionId: ObjectId
  healthScores: {
    stress: number
    sleep: number
  }
  createdAt: Date
  updatedAt: Date
}

export async function updateUser(
  updateUserDTO: UpdateUserDTO,
  userID: ObjectId,
): Promise<UserDocument> {
  // TODO: validate register request body
  console.log(updateUserDTO)

  const updatedUser = new User({
    tel: updateUserDTO.tel,
    password: updateUserDTO.password,
    name: updateUserDTO.name,
    email: updateUserDTO.email,
    hnId: updateUserDTO.hnId,
    lastFourId: updateUserDTO.lastFourId,
    dateOfBirth: updateUserDTO.dateOfBirth,
    gender: updateUserDTO.gender,
    education: updateUserDTO.education,
    historyId: updateUserDTO.historyId,
    badge: updateUserDTO.badge,
    preconditionId: updateUserDTO.preconditionId,
    // healthScores: {
    //   stress: updateUserDTO.healthScores.stress,
    //   sleep: updateUserDTO.healthScores.sleep,
    // },
  })
  const query = { tel: updateUserDTO.tel }

  User.findOneAndUpdate(query, { $set: updatedUser })
  console.log(updatedUser)
  return updatedUser
}
