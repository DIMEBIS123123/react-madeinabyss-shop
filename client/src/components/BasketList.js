import React, { useContext } from 'react'
import { Context } from '..'
import Row from 'react-bootstrap/esm/Row'
import BasketItem from './BasketItem'
import { observer } from 'mobx-react-lite'

const BasketList = observer(() => {
	const { device } = useContext(Context)
	return (
		<Row className='d-flex flex-wrap justify-content-start'>
			{device.basketDevices.map(basketItem => (
				<BasketItem key={basketItem.id} basketItem={basketItem}></BasketItem>
			))}
		</Row>
	)
})

export default BasketList
