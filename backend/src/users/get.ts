import { User } from './schema'

export async function getUserByID(id: string) {
  const user = await User.findById(id)
  return user
}
