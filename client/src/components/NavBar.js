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
import Image from 'react-bootstrap/esm/Image'
import border from '../assets/bar.png'

const NavBar = observer(() => {
	const { user, device } = useContext(Context)
	const navigate = useNavigate()
	const logout = () => {
		user.setUser({})
		user.setIsAuth(false)
	}
	return (
		<Navbar className='navbar' data-bs-theme='dark'>
			<Image className='border-image top' src={border}></Image>
			<Container>
				<NavLink
					to={SHOP_ROUTE}
					className='nav-link d-flex flex-column align-items-center text-lg-center'
				>
					<img
						src='../assets/MadeInAbyss_logo.svg.png'
						width={50}
						height={50}
						alt=''
					/>
					Made in Abyss <br /> Relics, Tools and Curiosities
				</NavLink>
				{user.isAuth ? (
					<Nav className='ml-auto' style={{ color: 'white' }}>
						<Button
							variant='outline-dark'
							onClick={() => {
								navigate(ADMIN_ROUTE)
							}}
							className='align-self-center nav-link'
						>
							Админ Панель
						</Button>

						<Button
							variant='outline-light'
							onClick={() => {
								logout()
							}}
							className='ms-4 align-self-center nav-link'
						>
							Выйти
						</Button>
						<Button
							onClick={() => {
								device.setBasketWindow(true)
							}}
							className='nav-link ms-4 bg-transparent border-0 justify-self-end d-flex flex-column align-items-center justify-content-center flex-wrap'
						>
							<img src='../assets/basket.webp' alt='' width={50} height={50} />В
							Экспедицию! {device.basketCount}
						</Button>
					</Nav>
				) : (
					<Nav className='ml-auto' style={{ color: 'white' }}>
						<Button
							variant='outline-light'
							onClick={() => navigate(LOGIN_ROUTE)}
							className='nav-link'
						>
							Авторизация
						</Button>
					</Nav>
				)}
			</Container>
			<Image className='border-image' src={border}></Image>
		</Navbar>
	)
})

export default NavBar
