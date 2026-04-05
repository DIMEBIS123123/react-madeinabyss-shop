import React, { useContext, useRef, useState } from 'react'
import Container from 'react-bootstrap/esm/Container'
import BasketList from '../components/BasketList'
import '../css/basket-page.scss'
import { observer } from 'mobx-react-lite'
import Button from 'react-bootstrap/esm/Button'
import { useNavigate } from 'react-router-dom'
import '../css/abyss-animation.scss'
import { SHOP_ROUTE } from '../utils/consts'
import abyssSound from '../assets/kevin-penkin-to-the-abyss.mp3'
import { Context } from '..'

const Basket = observer(() => {
	const { device } = useContext(Context)
	const navigate = useNavigate()
	const audioRef = useRef(null)
	const [abyssDrop, setAbyssDrop] = useState(false)
	// const navigate = useNavigate();

	const handleExpedition = () => {
		if (abyssDrop) return

		setAbyssDrop(true)
		if (device.abyssAnimation !== 'idle') return

		device.setAbyssAnimation('active')

		if (audioRef.current) {
			audioRef.current.pause()
			audioRef.current.currentTime = 2.5
			audioRef.current.volume = 0.75
			audioRef.current.play().catch(err => {
				console.log('Ошибка воспроизведения аудио:', err)
			})
		}

		setTimeout(() => {
			navigate(SHOP_ROUTE)
		}, 4000)
		document.body.classList.add('abyss-shake')
		setTimeout(() => {
			document.body.classList.remove('abyss-shake')
		}, 350)
	}
	return (
		<Container className='basket-container'>
			<div className={`abyss-void ${abyssDrop ? 'active' : ''}`}>
				<audio ref={audioRef} src={abyssSound} preload='auto' />
				<div className='abyss-void__fog' />

				<div className='abyss-void__drip abyss-void__drip--1' />
				<div className='abyss-void__drip abyss-void__drip--2' />
				<div className='abyss-void__drip abyss-void__drip--3' />
				<div className='abyss-void__drip abyss-void__drip--4' />
				<div className='abyss-void__drip abyss-void__drip--5' />
				<div className='abyss-void__drip abyss-void__drip--6' />

				<div className='abyss-void__curtain' />

				<div className='abyss-void__message'>
					<span>Спуск начинается...</span>
				</div>
			</div>
			<h1 className='text-lg-center'>
				{device.basketCount > 0
					? 'Экспедиция Собрана!'
					: 'Экспедиция нуждается хоть в ком то!'}
			</h1>
			<BasketList></BasketList>
			{device.basketCount > 0 ? (
				<div className='basket-summary'>
					<div className='basket-summary__actions'>
						<Button
							onClick={() => handleExpedition()}
							disabled={abyssDrop}
							className='basket-expedition-btn'
						>
							Отправиться в экспедицию!
						</Button>
					</div>
				</div>
			) : null}
		</Container>
	)
})

export default Basket
