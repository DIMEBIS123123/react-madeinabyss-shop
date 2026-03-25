import { observer } from 'mobx-react-lite'
import React, { useContext } from 'react'
import { Context } from '..'
import Pagination from 'react-bootstrap/Pagination'

const Pages = observer(() => {
	const { device } = useContext(Context)
	const pageCount = Math.ceil(device.totalCount / device.limit)
	const pages = []
	for (let i = 0; i < pageCount; i++) {
		pages.push(i + 1)
	}
	return (
		<Pagination className='mt-5'>
			{pages.map(i => (
				<Pagination.Item
					key={i}
					active={device.page === i}
					onClick={() => device.setPage(i)}
				>
					{i}
				</Pagination.Item>
			))}
		</Pagination>
	)
})

export default Pages
