import React, { useContext } from 'react'
import { Routes, Route, useNavigate } from 'react-router-dom'
import { authRoutes, publicRoutes } from '../routes'
import Shop from '../pages/Shop'
import { Context } from '..'
import { observer } from 'mobx-react-lite'

const AppRouter = observer(() => {
	const { user } = useContext(Context)

	return (
		<Routes>
			{user.isAuth &&
				authRoutes.map(({ path, Component }) => (
					<Route key={path} path={path} element={Component} />
				))}
			{publicRoutes.map(({ path, Component }) => (
				<Route key={path} path={path} element={Component} />
			))}
			<Route path='*' element={<Shop />} />
		</Routes>
	)
})

export default AppRouter
