import React, { useContext } from 'react'
import { Context } from '..'
import Container from 'react-bootstrap/Container'
import Nav from 'react-bootstrap/Nav'
import Navbar from 'react-bootstrap/Navbar'
import { NavLink, useNavigate } from 'react-router-dom'
import {
	ADMIN_ROUTE,
	BASKET_ROUTE,
	LOGIN_ROUTE,
	SHOP_ROUTE,
} from '../utils/consts'
import Button from 'react-bootstrap/Button'
import { observer } from 'mobx-react-lite'

const NavBar = observer(() => {
	const { user } = useContext(Context)
	const navigate = useNavigate()
	const logout = () => {
		user.setUser({})
		user.setIsAuth(false)
	}
	return (
		<Navbar bg='dark' data-bs-theme='dark'>
			<Container>
				<NavLink
					style={{
						color: '#ffa500',
						fontWeight: 'bold',
						textDecoration: 'none',
					}}
					to={SHOP_ROUTE}
					className='d-flex flex-column align-items-center'
				>
					<img
						src='../assets/MadeInAbyss_logo.svg.png'
						width={50}
						height={50}
						alt=''
					/>
					Аниме Магазин
				</NavLink>
				{user.isAuth ? (
					<Nav className='ml-auto' style={{ color: 'white' }}>
						<Button
							variant='outline-light'
							onClick={() => {
								navigate(ADMIN_ROUTE)
							}}
							className='align-self-center'
						>
							Админ Панель
						</Button>

						<Button
							variant='outline-light'
							onClick={() => {
								logout()
							}}
							className='ms-4 align-self-center'
						>
							Выйти
						</Button>
						<Button
							onClick={() => {
								navigate(BASKET_ROUTE)
							}}
							className='ms-4 bg-transparent border-0 justify-self-end d-flex flex-column align-items-center justify-content-center flex-wrap'
						>
							<img src='../assets/basket.webp' alt='' width={50} height={50} />
							Корзина
						</Button>
					</Nav>
				) : (
					<Nav className='ml-auto' style={{ color: 'white' }}>
						<Button
							variant='outline-light'
							onClick={() => navigate(LOGIN_ROUTE)}
						>
							Авторизация
						</Button>
					</Nav>
				)}
			</Container>
		</Navbar>
	)
})

export default NavBar
