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
				className={
					'p-3 m-2 brand-nav-item ' +
					(device.selectedBrand.id === undefined ? 'brand-nav-item-active' : '')
				}
				onClick={() => device.setSelectedBrand({})}
			>
				Все Брэнды
			</Card>
			{device.brands.map(brand => (
				<Card
					key={brand.id}
					className={
						'p-3 m-2 brand-nav-item ' +
						(device.selectedBrand.id === brand.id
							? 'brand-nav-item-active'
							: '')
					}
					onClick={() => device.setSelectedBrand(brand)}
				>
					{brand.name}
				</Card>
			))}
		</Row>
	)
})

export default BrandBar
