const Router = require('express')

const router = new Router()
const deviceController = require('../controllers/deviceController')

router.post('/create', deviceController.create)
router.get('/', deviceController.getAll)
router.get('/:id', deviceController.getOne)
router.post('/createBasketDevice', deviceController.createBasketDevice)

module.exports = router
