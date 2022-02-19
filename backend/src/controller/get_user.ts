import { User } from '../model/user'

export async function getUserByID(id: string) {
  const user = await User.findById(id)
  return user
}
