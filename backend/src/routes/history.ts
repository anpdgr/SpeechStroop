import express, { Request } from 'express'
import { getHistoryByID } from 'src/controller/get_history'
import { HistoryDTO, setHistory } from 'src/controller/set_history'
import { HistoryDocument } from 'src/model/history'
import { RequestWithUser } from 'src/types/express'

const router = express.Router()
router.use(express.json())
router.use(express.urlencoded({ extended: true }))

router.get('', async (req: RequestWithUser, res) => {
  const history = await getHistoryByID(req.user._id);
  res.json(history);
})

router.post('', async (req: RequestWithUser, res) => {
  try {
    const body = req.body;
    const history: HistoryDocument = await setHistory(body, req.user._id);
    res.json(history);
  } catch (err) {
    res.status(400).send(err);
  }
})

export default router
