const Router = require('express')

const router = new Router()
const deviceController = require('../controllers/deviceController')
const authMiddleware = require('../middleware/authMiddleware')

router.post('/create', deviceController.create)
router.get(
	'/getBasketDevices',
	authMiddleware,
	deviceController.getBasketDevices,
)
router.post(
	'/deleteBasketDevice',
	authMiddleware,
	deviceController.deleteBasketDevice,
)
router.get('/', deviceController.getAll)
router.get('/:id', deviceController.getOne)
router.post('/createBasketDevice', deviceController.createBasketDevice)

module.exports = router
