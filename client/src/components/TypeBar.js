import { observer } from 'mobx-react-lite'
import React, { useContext } from 'react'
import { Context } from '..'
import ListGroup from 'react-bootstrap/ListGroup'

const TypeBar = observer(() => {
	const { device } = useContext(Context)
	return (
		<ListGroup className='filters-row'>
			<ListGroup.Item
				active={device.selectedType.id === undefined}
				onClick={() => device.setSelectedType({})}
				key={666}
				className='typebar-item'
			>
				Все Слои
			</ListGroup.Item>
			{device.types.map(type => (
				<ListGroup.Item
					active={type.id === device.selectedType.id}
					onClick={() => device.setSelectedType(type)}
					key={type.id}
					className='typebar-item'
				>
					{type.name}
				</ListGroup.Item>
			))}
		</ListGroup>
	)
})

export default TypeBar
