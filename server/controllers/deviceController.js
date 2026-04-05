const uuid = require('uuid')
const path = require('path')
const { Device, DeviceInfo, BasketDevice, Basket } = require('../models/models')
const ApiError = require('../error/ApiError')

class DeviceController {
	async create(req, res, next) {
		try {
			let { name, price, brandId, typeId, info } = req.body
			const { img } = req.files
			let fileName = uuid.v4() + '.jpg'
			img.mv(path.resolve(__dirname, '..', 'static', fileName))

			const device = await Device.create({
				name,
				price,
				brandId,
				typeId,
				img: fileName,
			})

			if (info) {
				info = JSON.parse(info)
				info.forEach(i =>
					DeviceInfo.create({
						title: i.title,
						description: i.description,
						deviceId: device.id,
					}),
				)
			}

			return res.json(device)
		} catch (e) {
			next(ApiError.badRequest(e.message))
		}
	}
	async createBasketDevice(req, res, next) {
		let { deviceId, userId } = req.body
		let basket = await Basket.findOne({
			where: { userId: userId },
		})
		const basketDevice = await BasketDevice.create({
			deviceId: deviceId,
			basketId: basket.id,
		})
		return res.json(basketDevice)
	}
	async getAll(req, res) {
		let { brandId, typeId, limit, page } = req.query
		page = page || 1
		limit = limit || 9
		let offset = page * limit - limit
		let devices
		if (!brandId && !typeId) {
			devices = await Device.findAndCountAll({ limit, offset })
		}
		if (brandId && !typeId) {
			devices = await Device.findAndCountAll({
				where: { brandId },
				limit,
				offset,
			})
		}
		if (!brandId && typeId) {
			devices = await Device.findAndCountAll({
				where: { typeId },
				limit,
				offset,
			})
		}
		if (brandId && typeId) {
			devices = await Device.findAndCountAll({
				where: { brandId, typeId },
				limit,
				offset,
			})
		}
		return res.json(devices)
	}
	async deleteBasketDevice(req, res) {
		const userId = req.user.id
		let basket = await Basket.findOne({
			where: { userId },
		})
		let basketDeviceId = req.body.id
		await BasketDevice.destroy({
			where: {
				id: basketDeviceId,
				basketId: basket.id,
			},
		})
		return res.json({ message: 'Из Экспедиции убрано 1 нечто!' })
	}
	async deleteAllBasketDevices(req, res) {
		const userId = req.user.id
		let basket = await Basket.findOne({
			where: { userId },
		})

		await BasketDevice.destroy({
			where: {
				basketId: basket.id,
			},
		})
		return res.json({ message: 'Из Экспедиции всё убрано!' })
	}
	async getBasketDevices(req, res) {
		const userId = req.user.id
		let basket = await Basket.findOne({
			where: { userId },
		})
		let basketDevices = await BasketDevice.findAndCountAll({
			where: { basketId: basket.id },
			include: [{ model: Device }],
		})
		return res.json(basketDevices)
	}

	async getOne(req, res) {
		const { id } = req.params
		const device = await Device.findOne({
			where: { id },
			include: [{ model: DeviceInfo, as: 'info' }],
		})
		return res.json(device)
	}
}
module.exports = new DeviceController()
