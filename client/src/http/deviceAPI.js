import { $authHost, $host } from '.'
import { jwtDecode } from 'jwt-decode'

export const createType = async type => {
	const { data } = await $authHost.post('api/type/create', type)

	return data
}
export const fetchTypes = async () => {
	const { data } = await $host.get('api/type/getAll')

	return data
}
export const createBrand = async brand => {
	const { data } = await $authHost.post('api/brand/create', brand)

	return data
}
export const fetchBrands = async () => {
	const { data } = await $host.get('api/brand/getAll')

	return data
}
export const createDevice = async device => {
	try {
		const { data } = await $authHost.post('api/device/create', device)

		return data
	} catch (e) {
		console.log(e.response.data.message)
	}
}
export const createBasketDevice = async device => {
	try {
		const { data } = await $authHost.post(
			'api/device/createBasketDevice',
			device,
		)

		return data
	} catch (e) {
		console.log(e.response.data.message)
	}
}
export const fetchDevices = async (typeId, brandId, page, limit) => {
	const { data } = await $host.get('api/device', {
		params: {
			typeId,
			brandId,
			page,
			limit,
		},
	})

	return data
}
export const fetchOneDevice = async id => {
	const { data } = await $host.get('api/device/' + id)

	return data
}
