import React, { useContext } from 'react'
import Button from 'react-bootstrap/Button'
import Modal from 'react-bootstrap/Modal'
import { Context } from '../..'
import { observer } from 'mobx-react-lite'
import Badge from 'react-bootstrap/Badge'
import ListGroup from 'react-bootstrap/ListGroup'
import Image from 'react-bootstrap/esm/Image'
import '../../css/basket-modal.scss'
import {
	deleteAllBasketDevices,
	deleteBasketDevice,
} from '../../http/deviceAPI'
import { useNavigate } from 'react-router-dom'
import { BASKET_ROUTE } from '../../utils/consts'

const BasketWindow = observer(() => {
	const { device } = useContext(Context)
	const navigate = useNavigate()

	const deleteBasketDeviceFromBasket = id => {
		let freshBasketDevices = device.basketDevices.filter(
			deviceItem => deviceItem.id !== id,
		)
		device.setBasketDevices(freshBasketDevices)
		device.setBasketCount(device.basketCount - 1)
		deleteBasketDevice(id)
	}
	const deleteAllBasketDevicesFromBasket = () => {
		device.setBasketDevices([])
		device.setBasketCount(0)
		deleteAllBasketDevices()
	}
	return (
		<Modal
			show={device.basketWindow}
			onHide={() => device.setBasketWindow(false)}
			aria-labelledby='example-custom-modal-styling-title'
			className='basket-modal'
		>
			<Modal.Header closeButton>
				<Modal.Title id='example-custom-modal-styling-title'>
					В Экспедиции у нас: {device.basketCount}!
				</Modal.Title>
			</Modal.Header>
			<Modal.Body>
				<ListGroup as='ol' numbered>
					{device.basketDevices.map(basketDevice => (
						<ListGroup.Item
							as='li'
							className='d-flex justify-content-between align-items-start basket-modal-item'
							key={basketDevice.id}
						>
							<Image
								src={process.env.REACT_APP_API_URL + basketDevice.device.img}
								width={50}
								height={50}
								style={{ margin: 10 }}
							></Image>
							<div className='ms-2 me-auto'>
								<div className='fw-bold'>{basketDevice.device.name}</div>
							</div>

							<div className='basket-item__actions'>
								<Badge bg='primary' pill>
									{basketDevice.device.price}
								</Badge>
								<button
									type='button'
									className='basket-item__remove'
									onClick={() => deleteBasketDeviceFromBasket(basketDevice.id)}
									aria-label={`Удалить ${device.name} из корзины`}
									title='Убрать из экспедиции'
								>
									×
								</button>
							</div>
						</ListGroup.Item>
					))}
				</ListGroup>
			</Modal.Body>
			<Modal.Footer>
				{device.basketCount === 0 ? null : (
					<>
						<Button
							variant='warning'
							onClick={() => {
								deleteAllBasketDevicesFromBasket()
								device.setBasketWindow(false)
							}}
						>
							Очистить Рюкзак
						</Button>
						<Button
							variant='primary'
							onClick={() => {
								device.setBasketWindow(false)
								navigate(BASKET_ROUTE)
							}}
						>
							Собрать Экспедицию!
						</Button>
					</>
				)}
			</Modal.Footer>
		</Modal>
	)
})

export default BasketWindow
