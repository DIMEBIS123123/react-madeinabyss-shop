import React, { useContext } from 'react'
import { Context } from '..'
import { observer } from 'mobx-react-lite'

const AbyssTransition = observer(() => {
	const { device } = useContext(Context)
	return (
		<div
			className={`global-abyss-transition
          ${device.abyssAnimation === 'active' ? 'active' : ''}
          ${device.abyssAnimation === 'reveal' ? 'reveal' : ''}`}
		>
			<div className='global-abyss-transition__fog' />
		</div>
	)
})

export default AbyssTransition
