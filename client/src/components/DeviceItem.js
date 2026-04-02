import React, { useContext } from 'react'
import Col from 'react-bootstrap/esm/Col'
import Card from 'react-bootstrap/Card'
import Image from 'react-bootstrap/Image'
import { useNavigate } from 'react-router-dom'
import { DEVICE_ROUTE } from '../utils/consts'
import Button from 'react-bootstrap/Button'
import { Context } from '..'
import { createBasketDevice, getBasketDevices } from '../http/deviceAPI'

const DeviceItem = ({ deviceItem }) => {
	const navigate = useNavigate()
	const { user, device } = useContext(Context)
	const addToCart = () => {
		createBasketDevice({ userId: user.user.id, deviceId: deviceItem.id })
		getBasketDevices().then(data => {
			device.setBasketCount(data.count)
			device.setBasketDevices(data.rows)
		})
	}
	return (
		<Col
			md={3}
			className='mt-3 '
			onClick={() => navigate(DEVICE_ROUTE + '/' + deviceItem.id)}
		>
			<Card className='device-item'>
				<Image
					width='100%'
					height={150}
					src={process.env.REACT_APP_API_URL + deviceItem.img}
				/>
				<div className='d-flex justify-content-between align-items-center device-item-text'>
					<div>{deviceItem.name}</div>
					<div>
						<div>{deviceItem.rating}☆</div>
					</div>
				</div>
				<Button
					variant='warning'
					style={{ fontSize: '13px', fontWeight: '500' }}
					onClick={e => {
						e.stopPropagation()

						addToCart()
					}}
				>
					Добавить В Корзину
				</Button>
			</Card>
		</Col>
	)
}

export default DeviceItem
