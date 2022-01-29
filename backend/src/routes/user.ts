import express from 'express'
import { RequestWithUser } from 'src/types/express'

const router = express.Router()
router.use(express.json())
router.use(express.urlencoded({ extended: true }))

router.get('/profile', async (req: RequestWithUser, res) => {
  res.json(req.user)
})

export default router
