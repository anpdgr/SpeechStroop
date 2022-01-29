import express, { Request, Response } from 'express'
import passport from 'passport'
import { login, LoginDTO } from 'src/auth/login'
import { register, RegisterDTO } from 'src/auth/register'
import { RequestWithUser } from 'src/types/express'

const router = express.Router()
router.use(express.json())
router.use(express.urlencoded({ extended: true }))

router.post('/login', async (req: Request<{}, {}, LoginDTO>, res: Response) => {
  const body = req.body
  if (!body.tel || !body.password) {
    return res.status(400).json({
      error: 'email and/or password is missing',
    })
  }
  const response = await login({ tel: body.tel, password: body.password })
  res.json(response)
})

router.post(
  '/register',
  async (req: Request<{}, {}, RegisterDTO>, res: Response) => {
    const body = req.body
    const user = await register(body)
    res.json(user)
  },
)

// routes below this are protected
router.use(passport.authenticate('jwt', { session: false }))

router.get('/me', async (req: RequestWithUser, res: Response) => {
  res.json(req.user)
})

export default router
