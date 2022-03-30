import bcrypt from 'bcrypt'
import { ObjectId } from 'mongodb'
import { HttpError } from 'src/errors'
import { User, UserDocument } from 'src/model/user'

export interface RegisterDTO {
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

const saltRounds = 12

export async function register(
  registerDTO: RegisterDTO,
): Promise<UserDocument> {
  const user = await User.findOne({
    tel: registerDTO.tel,
  })
  
  // ไม่ควร check ในนี้ เพราะอันนี้จะ trigger ตอน sleep form
  if (user) {
    throw new HttpError(409, 'user with this phone number already exists')
  }

  // TODO: validate register request body

  const hashedPassword = bcrypt.hashSync(registerDTO.password, saltRounds)
  const newUser = new User({
    tel: registerDTO.tel,
    password: hashedPassword,
    name: registerDTO.name,
    email: registerDTO.email,
    hnId: registerDTO.hnId,
    lastFourId: registerDTO.lastFourId,
    dateOfBirth: registerDTO.dateOfBirth,
    gender: registerDTO.gender,
    education: registerDTO.education,
    historyId: registerDTO.historyId,
    badge: registerDTO.badge,
    preconditionId: registerDTO.preconditionId,
    healthScores: {
      stress: registerDTO.healthScores.stress,
      sleep: registerDTO.healthScores.sleep,
    },
  })

  await newUser.save()
  newUser.set('password', undefined) //not return password
  console.log(newUser)
  return newUser
}
