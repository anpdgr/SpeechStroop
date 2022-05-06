import express from 'express'
import { getBadges } from 'src/controller/get_badge'
import { setBadge } from 'src/controller/set_badge'
import { BadgeDocument } from 'src/model/badge'
import { RequestWithUser } from 'src/types/express'

const router = express.Router()
router.use(express.json())
router.use(express.urlencoded({ extended: true }))

router.post('', async (req: RequestWithUser, res) => {
  try {
    const body = req.body
    const badge: BadgeDocument = await setBadge(body)
    res.json(badge)
  } catch (err) {
    res.status(400).send(err)
  }
})

router.get('/all', async (req: RequestWithUser, res) => {
  try {
    const badge = await getBadges()
    res.json(badge)
  } catch (err) {
    console.log('err:\t', err)
    res.status(400).send(err)
  }
})

export default router
