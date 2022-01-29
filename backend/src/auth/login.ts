import bcrypt from 'bcrypt'
import { HttpError } from 'src/errors'
import { User } from 'src/users/schema'
import { signJWT } from './jwt'

export interface LoginDTO {
  tel: string
  password: string
}

export interface LoginResponse {
  token: string
  _id: string
}

export async function login({
  tel,
  password,
}: LoginDTO): Promise<LoginResponse> {
  const user = await User.findOne({
    tel: tel,
  }).select('password')
  if (!user) {
    throw new HttpError(404, "can't find this phone number")
  }

  if (!bcrypt.compareSync(password, user.password)) {
    throw new HttpError(400, 'invalid password')
  }

  return {
    token: signJWT({ _id: user._id }),
    _id: user._id,
  }
}
