import React, { useContext } from 'react'
import Col from 'react-bootstrap/esm/Col'
import Card from 'react-bootstrap/Card'
import Image from 'react-bootstrap/Image'
import { useNavigate } from 'react-router-dom'
import { DEVICE_ROUTE } from '../utils/consts'
import Button from 'react-bootstrap/Button'
import { Context } from '..'
import { createBasketDevice } from '../http/deviceAPI'

const DeviceItem = ({ device }) => {
	const navigate = useNavigate()
	const { user } = useContext(Context)
	const addToCart = () => {
		createBasketDevice({ userId: user.user.id, deviceId: device.id })
	}
	return (
		<Col
			md={3}
			className='mt-3'
			onClick={() => navigate(DEVICE_ROUTE + '/' + device.id)}
		>
			<Card style={{ width: 150, cursor: 'pointer' }} border='light'>
				<Image
					width={150}
					height={150}
					src={process.env.REACT_APP_API_URL + device.img}
				/>
				<div className='d-flex justify-content-between align-items-center'>
					<div>{device.name}</div>
					<div>
						<div>{device.rating}☆</div>
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
