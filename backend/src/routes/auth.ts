import express, { Request, Response } from 'express'
import { login, LoginDTO } from 'src/controller/login'
import { register, RegisterDTO } from 'src/controller/register'

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

export default router
