import React, { useState } from 'react'
import Button from 'react-bootstrap/esm/Button'
import Container from 'react-bootstrap/esm/Container'
import CreateBrand from '../components/modals/CreateBrand'
import CreateDevice from '../components/modals/CreateDevice'
import CreateType from '../components/modals/CreateType'
const Admin = () => {
	const [brandVisible, setBrandVisible] = useState(false)
	const [deviceVisible, setDeviceVisible] = useState(false)
	const [typeVisible, setTypeVisible] = useState(false)
	return (
		<Container className='d-flex flex-column gap-3'>
			<Button
				style={{ marginTop: '15px' }}
				variant='outline-dark'
				onClick={() => setTypeVisible(true)}
			>
				Добавить тип
			</Button>
			<Button variant='outline-dark' onClick={() => setBrandVisible(true)}>
				Добавить бренд
			</Button>
			<Button variant='outline-dark' onClick={() => setDeviceVisible(true)}>
				Добавить устройство
			</Button>
			<CreateBrand
				show={brandVisible}
				onHide={() => setBrandVisible(false)}
			></CreateBrand>
			<CreateDevice
				show={deviceVisible}
				onHide={() => setDeviceVisible(false)}
			></CreateDevice>
			<CreateType
				show={typeVisible}
				onHide={() => setTypeVisible(false)}
			></CreateType>
		</Container>
	)
}

export default Admin
