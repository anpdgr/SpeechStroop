import express from 'express'
import passport from 'passport'
import { getUserByID } from '../users/get'

const router = express.Router()
router.use(express.json())
router.use(express.urlencoded({ extended: true }))

router.get('/:_id', async (req, res) => {
  const id = req.params['_id']
  const resp = await getUserByID(id)
  res.send(resp)
})

// routes below this are protected
router.use(passport.authenticate('jwt', { session: false }))

export default router
