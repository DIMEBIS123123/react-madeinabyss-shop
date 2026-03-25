import React, { useContext, useState } from 'react'
import Container from 'react-bootstrap/esm/Container'
import Card from 'react-bootstrap/Card'
import Form from 'react-bootstrap/Form'
import Button from 'react-bootstrap/esm/Button'
import Row from 'react-bootstrap/Row'
import { NavLink, useLocation, useNavigate } from 'react-router-dom'
import { LOGIN_ROUTE, REGISTRATION_ROUTE, SHOP_ROUTE } from '../utils/consts'
import { login, registration } from '../http/userAPI'
import { Context } from '..'
import { observer } from 'mobx-react-lite'

const Auth = observer(() => {
	const { user } = useContext(Context)
	const location = useLocation()
	const isLogin = location.pathname === LOGIN_ROUTE
	const navigate = useNavigate()

	const [email, setEmail] = useState('')
	const [password, setPassword] = useState('')

	const click = async () => {
		try {
			let userdata
			if (isLogin) {
				userdata = await login(email, password)
			} else {
				userdata = await registration(email, password)
			}
			user.setUser(userdata)
			user.setIsAuth(true)
			navigate(SHOP_ROUTE)
		} catch (e) {
			alert(e.response?.data?.message || 'Произошла ошибка')
		}
	}
	return (
		<Container
			className='d-flex justify-content-center align-items-center'
			style={{ height: window.innerHeight - 54 }}
		>
			<Card style={{ width: 600 }} className='p-5'>
				<h2 className='m-auto'>{isLogin ? 'Авторизация' : 'Регистрация'}</h2>
				<Form className='d-flex flex-column'>
					<Form.Control
						placeholder='Введите ваш email...'
						value={email}
						onChange={e => setEmail(e.target.value)}
						className='mt-3'
					/>
					<Form.Control
						placeholder='Введите ваш пароль...'
						value={password}
						onChange={e => setPassword(e.target.value)}
						className='mt-3'
						type='password'
					/>
				</Form>
				<Row className='d-flex flex-column' style={{ padding: '0px 15px' }}>
					{isLogin ? (
						<div style={{ padding: '0px' }} className='mt-3'>
							Нет аккаунта?{' '}
							<NavLink to={REGISTRATION_ROUTE}>Зарегистрируйся!</NavLink>
						</div>
					) : (
						<div style={{ padding: '0px' }} className='mt-3'>
							Есть Аккаунт? <NavLink to={LOGIN_ROUTE}>Войдите!</NavLink>
						</div>
					)}

					<Button
						style={{ padding: '5px 0px' }}
						className='mt-3'
						variant='outline-success'
						onClick={click}
					>
						{isLogin ? 'Войти' : 'Зарегистрируйся'}
					</Button>
				</Row>
			</Card>
		</Container>
	)
})

export default Auth
