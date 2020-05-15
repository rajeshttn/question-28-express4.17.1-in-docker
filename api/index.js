var express = require('express');
var cors = require('cors');

const router = express.Router()
router.use(cors())

router.post('/add', async (req, res) => {
  const { body } = req
  const { number1 = 0, number2 = 0 } = body
  res.json({
    sum: number1 + number2
  })
})

router.use((req, res) => {
  res.status(404)
  res.json({
    error: 'endpoint not found',
    path: req.originalUrl,
  })
})

router.use((err, req, res) => {
  const statusCode = err.status || 500
  res.status(statusCode)
  res.json({
    error: err.message,
    path: req.originalUrl,
  })
})

module.exports = router;
