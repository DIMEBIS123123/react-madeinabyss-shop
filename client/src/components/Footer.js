import React from 'react'
import '../css/Footer.scss'
import Image from 'react-bootstrap/esm/Image'
import border from '../assets/bar.png'

const Footer = () => {
	return (
		<footer className='abyss-footer-mini'>
			<Image className='border-image top footer-border' src={border}></Image>
			<div className='abyss-footer-mini__inner'>
				<div className='abyss-footer-mini__warning'>
					<span className='abyss-footer-mini__icon'>⚠</span>
					<span className='abyss-footer-mini__text'>
						Глубже 5-го слоя — точка невозврата
					</span>
				</div>

				<a
					href='https://github.com/DIMEBIS123123'
					target='_blank'
					rel='noreferrer'
					className='abyss-footer-mini__link'
				>
					Журнал экспедиции — GitHub
				</a>
			</div>
		</footer>
	)
}

export default Footer
