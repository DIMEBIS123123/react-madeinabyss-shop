import React, { useContext, useEffect, useState } from 'react'
import Col from 'react-bootstrap/esm/Col'
import Container from 'react-bootstrap/esm/Container'
import Image from 'react-bootstrap/esm/Image'
import Row from 'react-bootstrap/esm/Row'
import Card from 'react-bootstrap/Card'
import Button from 'react-bootstrap/esm/Button'
import { useParams } from 'react-router-dom'
import {
	createBasketDevice,
	fetchOneDevice,
	getBasketDevices,
} from '../http/deviceAPI'
import '../css/devicePage.scss'
import { Context } from '..'

const DevicePage = () => {
	const [deviceItem, setDeviceItem] = useState({ info: [] })
	const params = useParams()
	const { user, device } = useContext(Context)
	const addToCart = () => {
		createBasketDevice({ userId: user.user.id, deviceId: deviceItem.id })
		getBasketDevices().then(data => {
			device.setBasketCount(data.count)
			device.setBasketDevices(data.rows)
		})
	}

	useEffect(() => {
		fetchOneDevice(params.id).then(data => setDeviceItem(data))
	}, [])
	return (
		<Container className='mt-3'>
			<Row className='flex-column justify-content-center align-items-center'>
				<Col>
					<Image
						width={300}
						height={300}
						style={{ borderRadius: '50%' }}
						src={process.env.REACT_APP_API_URL + deviceItem.img}
					/>
				</Col>
				<Col>
					<Row className='flex-column align-items-center'>
						<h2>{deviceItem.name} </h2>
						<h3>{deviceItem.price}☆</h3>
						<h1>Характеристики</h1>

						{deviceItem.info.map((info, index) => (
							<Row
								key={info.id}
								style={{
									background: index % 2 === 0 ? 'lightgray' : 'transparent',
									padding: 10,
								}}
							>
								{info.title}:{info.description}
							</Row>
						))}
					</Row>
				</Col>
				<Col>
					<div class='device-summary'>
						<div class='device-summary__actions'>
							<button
								type='button'
								class='device-expedition-btn btn btn-primary'
								onClick={addToCart}
							>
								Добавить В Экспедицию
							</button>
						</div>
					</div>
				</Col>
			</Row>
			<Row className='d-flex flex-column m-3'></Row>
		</Container>
	)
}

export default DevicePage
