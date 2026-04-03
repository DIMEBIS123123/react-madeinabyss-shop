import React from 'react'
import '../css/Footer.scss'

const Footer = () => {
	return (
		<footer className='abyss-footer-mini'>
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
