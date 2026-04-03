import React, { useContext, useEffect, useState } from 'react'
import { BrowserRouter } from 'react-router-dom'
import AppRouter from './components/AppRouter'
import NavBar from './components/NavBar'
import { observer } from 'mobx-react-lite'
import { Context } from '.'
import { check } from './http/userAPI'
import Spinner from 'react-bootstrap/Spinner'
import { fetchBrands, fetchDevices, fetchTypes } from './http/deviceAPI'
import { getBasketDevices } from './http/deviceAPI'
import BasketWindow from './components/modals/BasketWindow'
import './css/style.scss'
import Image from 'react-bootstrap/esm/Image'
import border from './assets/bar.png'
import Footer from './components/Footer'

const App = observer(() => {
	const { user, device } = useContext(Context)
	const [loading, setLoading] = useState(true)

	useEffect(() => {
		fetchTypes().then(data => device.setTypes(data))
		fetchBrands().then(data => device.setBrands(data))
		fetchDevices(
			device.selectedType.id,
			device.selectedBrand.id,
			device.page,
			device.limit,
		).then(data => {
			device.setDevices(data.rows)
			device.setTotalCount(data.count)
		})
	}, [device.page, device.limit, device.selectedType, device.selectedBrand])

	useEffect(() => {
		setTimeout(() => {
			check()
				.then(data => {
					if (data) {
						user.setUser(data)
						user.setIsAuth(true)
					} else {
						user.setIsAuth(false)
					}
				})
				.finally(() => setLoading(false))
		}, 1000)
	}, [])
	useEffect(() => {
		if (user.isAuth) {
			getBasketDevices().then(data => {
				device.setBasketCount(data.count)
				device.setBasketDevices(data.rows)
			})
		}
	}, [user.isAuth])

	if (loading) {
		return <Spinner animation='grow'></Spinner>
	}
	return (
		<BrowserRouter>
			<NavBar />
			<AppRouter />
			<BasketWindow></BasketWindow>
			<Footer></Footer>
		</BrowserRouter>
	)
})

export default App
