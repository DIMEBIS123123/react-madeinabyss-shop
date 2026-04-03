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
				<div className='d-flex flex-column justify-content-between align-items-center device-item-text'>
					<div>{deviceItem.name}</div>
					<div>
						<div
							style={{
								color: deviceItem.price.toLowerCase().includes('синий')
									? '#2f6f79'
									: deviceItem.price.toLowerCase().includes('красный')
										? '#b93a32'
										: deviceItem.price.toLowerCase().includes('чёрный')
											? 'black'
											: deviceItem.price.toLowerCase().includes('фиолетовый')
												? 'purple'
												: '#f4ead7',
								textShadow: deviceItem.price.toLowerCase().includes('чёрный')
									? '-3px 0px 4px white'
									: '',
							}}
						>
							{deviceItem.price} ☆
						</div>
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
					Добавить В Экспедицию
				</Button>
			</Card>
		</Col>
	)
}

export default DeviceItem
