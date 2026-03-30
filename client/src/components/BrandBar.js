import { observer } from 'mobx-react-lite'
import React, { useContext } from 'react'
import { Context } from '..'
import Row from 'react-bootstrap/esm/Row'
import Card from 'react-bootstrap/Card'

const BrandBar = observer(() => {
	const { device } = useContext(Context)
	return (
		<Row className='d-flex justify-content-center align-items-center'>
			<Card
				style={{
					width: 'auto',
					cursor: 'pointer',
					backgroundColor: device.selectedBrand.id ? 'white' : '#0d6efd',
					color: device.selectedBrand.id ? 'black' : 'white',
				}}
				className='p-3 m-2'
				onClick={() => device.setSelectedBrand({})}
			>
				Все Брэнды
			</Card>
			{device.brands.map(brand => (
				<Card
					style={{
						width: 'auto',
						cursor: 'pointer',
						backgroundColor:
							brand.id === device.selectedBrand.id ? '#0d6efd' : 'white',
						color: brand.id === device.selectedBrand.id ? 'white' : 'black',
					}}
					key={brand.id}
					className='p-3 m-2'
					onClick={() => device.setSelectedBrand(brand)}
				>
					{brand.name}
				</Card>
			))}
		</Row>
	)
})

export default BrandBar
