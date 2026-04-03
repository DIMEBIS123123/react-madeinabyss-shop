import React, { useContext, useState } from 'react'
import Button from 'react-bootstrap/Button'
import Modal from 'react-bootstrap/Modal'
import Form from 'react-bootstrap/Form'
import Dropdown from 'react-bootstrap/Dropdown'
import { Context } from '../..'
import Row from 'react-bootstrap/esm/Row'
import Col from 'react-bootstrap/esm/Col'
import { observer } from 'mobx-react-lite'
import { createDevice } from '../../http/deviceAPI'
const CreateDevice = observer(({ show, onHide }) => {
	const { device } = useContext(Context)
	const [info, setInfo] = useState([])
	const [name, setName] = useState('')
	const [price, setPrice] = useState('')

	const [file, setFile] = useState()

	const addInfo = () => {
		setInfo([...info, { title: '', description: '', number: Date.now() }])
	}
	const removeInfo = number => {
		setInfo(info.filter(i => i.number !== number))
	}
	const changeInfo = (key, value, number) => {
		setInfo(info.map(i => (i.number === number ? { ...i, [key]: value } : i)))
	}
	const addDevice = () => {
		const formData = new FormData()
		formData.append('name', name)

		formData.append('price', price)
		formData.append('brandId', device.selectedBrand.id)
		formData.append('typeId', device.selectedType.id)
		formData.append('info', JSON.stringify(info)) // если это массив/объект
		formData.append('img', file) // file = input.files[0]
		console.log(info)

		createDevice(formData).then(data => onHide())
	}

	const selectFile = e => {
		setFile(e.target.files[0])
	}
	return (
		<Modal size='lg' centered show={show} onHide={onHide}>
			<Modal.Header closeButton>
				<Modal.Title id='contained-modal-title-vcenter'>
					Добавить новый девайс
				</Modal.Title>
			</Modal.Header>
			<Modal.Body>
				<Form>
					<Dropdown>
						<Dropdown.Toggle>
							{device.selectedType.name || 'Выберите Слой Бездны'}
						</Dropdown.Toggle>
						<Dropdown.Menu>
							{device.types.map(type => (
								<Dropdown.Item
									onClick={() => device.setSelectedType(type)}
									key={type.id}
								>
									{type.name}
								</Dropdown.Item>
							))}
						</Dropdown.Menu>
					</Dropdown>
					<Dropdown className='mt-3'>
						<Dropdown.Toggle>
							{device.selectedBrand.name || 'Выберите Секцию'}
						</Dropdown.Toggle>
						<Dropdown.Menu>
							{device.brands.map(brand => (
								<Dropdown.Item
									onClick={() => device.setSelectedBrand(brand)}
									key={brand.id}
								>
									{brand.name}
								</Dropdown.Item>
							))}
						</Dropdown.Menu>
					</Dropdown>
					<Form.Control
						value={name}
						onChange={e => setName(e.target.value)}
						className='mt-3'
						placeholder='Введите название'
					/>
					<Form.Control
						value={price}
						onChange={e => setPrice(e.target.value)}
						className='mt-3'
						placeholder='Введите описание'
					/>
					<Form.Control className='mt-3' type='file' onChange={selectFile} />
					<hr />
					<Button variant='outline-dark' onClick={addInfo}>
						Добавить новое свойство
					</Button>
					{info.map(i => (
						<Row className='mt-4' key={i.number}>
							<Col md={4}>
								<Form.Control
									value={i.title}
									onChange={e => changeInfo('title', e.target.value, i.number)}
									placeholder='Введите название свойства'
								></Form.Control>
							</Col>
							<Col md={4}>
								<Form.Control
									value={i.description}
									onChange={e =>
										changeInfo('description', e.target.value, i.number)
									}
									placeholder='Введите описание свойства'
								></Form.Control>
							</Col>
							<Col md={4}>
								<Button
									variant='outline-danger'
									onClick={() => removeInfo(i.number)}
								>
									Удалить свойство
								</Button>
							</Col>
						</Row>
					))}
				</Form>
			</Modal.Body>
			<Modal.Footer>
				<Button variant='outline-danger' onClick={onHide}>
					Закрыть
				</Button>
				<Button variant='outline-success' onClick={addDevice}>
					Добавить
				</Button>
			</Modal.Footer>
		</Modal>
	)
})

export default CreateDevice
