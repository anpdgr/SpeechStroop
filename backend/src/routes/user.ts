import express from 'express'
import { updateUser } from 'src/controller/update_user'
import { RequestWithUser } from 'src/types/express'

const router = express.Router()
router.use(express.json())
router.use(express.urlencoded({ extended: true }))

router.get('/profile', async (req: RequestWithUser, res) => {
  res.json(req.user)
})

router.post('/profile', async (req: RequestWithUser, res) => {
  const body = req.body
  const user = await updateUser(body, req.user.id)
  res.json(user)
})

export default router
