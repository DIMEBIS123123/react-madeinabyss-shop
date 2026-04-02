import React, { useContext, useEffect } from 'react'
import Container from 'react-bootstrap/esm/Container'
import Row from 'react-bootstrap/esm/Row'
import Col from 'react-bootstrap/Col'
import TypeBar from '../components/TypeBar'
import BrandBar from '../components/BrandBar'
import DeviceList from '../components/DeviceList'
import { observer } from 'mobx-react-lite'
import { Context } from '..'
import { fetchBrands, fetchDevices, fetchTypes } from '../http/deviceAPI'
import Pages from '../components/Pages'

const Shop = observer(() => {
	const { device } = useContext(Context)

	return (
		<Container>
			<Row className=' position-relative main-content'>
				<Col md={3}>
					<TypeBar />
				</Col>
				<Col md={9}>
					<BrandBar />
					<DeviceList />
					<Pages></Pages>
				</Col>
			</Row>
		</Container>
	)
})

export default Shop
