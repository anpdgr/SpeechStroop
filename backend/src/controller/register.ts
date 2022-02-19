import bcrypt from 'bcrypt'
import { HttpError } from 'src/errors'
import { User, UserDocument } from 'src/model/user'

export interface RegisterDTO {
  tel: string
  password: string
  name: string
  email: string
  lastFourId: number
  age: number
  gender: string
  education: string
  isColorBlind: boolean
  stress: number
  sleep: number
}

const saltRounds = 12

export async function register(
  registerDTO: RegisterDTO,
): Promise<UserDocument> {
  const user = await User.findOne({
    tel: registerDTO.tel,
  })
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
    lastFourId: registerDTO.lastFourId,
    age: registerDTO.age,
    gender: registerDTO.gender,
    education: registerDTO.education,
    isColorBlind: registerDTO.isColorBlind,
    stress: registerDTO.stress,
    sleep: registerDTO.sleep,
  })

  await newUser.save()
  newUser.set('password', undefined) //not return password
  console.log(newUser)
  return newUser
}
