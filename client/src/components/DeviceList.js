import React, { useContext } from 'react'
import { Context } from '..'
import { observer } from 'mobx-react-lite'
import Row from 'react-bootstrap/esm/Row'
import DeviceItem from './DeviceItem'

const DeviceList = observer(() => {
	const { device } = useContext(Context)

	return (
		<Row className='d-flex'>
			{device.devices.map(deviceItem => (
				<DeviceItem key={deviceItem.id} deviceItem={deviceItem} />
			))}
		</Row>
	)
})

export default DeviceList
