import React, { useContext } from 'react'
import Col from 'react-bootstrap/esm/Col'
import Image from 'react-bootstrap/esm/Image'
import Button from 'react-bootstrap/Button'
import { Context } from '..'
import { deleteBasketDevice } from '../http/deviceAPI'
import { observer } from 'mobx-react-lite'

const BasketItem = observer(({ basketItem }) => {
	const { device } = useContext(Context)
	const deleteBasketDeviceFromBasket = id => {
		let freshBasketDevices = device.basketDevices.filter(
			deviceItem => deviceItem.id !== id,
		)
		device.setBasketCount(device.basketCount - 1)
		device.setBasketDevices(freshBasketDevices)
		deleteBasketDevice(id)
	}
	return (
		<Col md={12} className='basketItem d-flex justify-content-around'>
			<Image
				src={process.env.REACT_APP_API_URL + basketItem.device.img}
				className='basket-item-img'
			></Image>
			<div className='basket-item-name'>{basketItem.device.name}</div>
			<div className='basket-item-badge'>{basketItem.device.price}</div>
			<Button
				type='button'
				className='basket-item-remove'
				onClick={() => deleteBasketDeviceFromBasket(basketItem.id)}
			>
				×
			</Button>
		</Col>
	)
})

export default BasketItem
