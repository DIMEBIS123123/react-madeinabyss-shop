import { makeAutoObservable } from 'mobx'

export default class DeviceStore {
	constructor() {
		this._types = []
		this._brands = []
		this._devices = []
		this._selectedType = {}
		this._selectedBrand = {}
		this._page = 1
		this._totalCount = 0
		this._limit = 3
		this._basketCount = 0
		this._basketDevices = []
		this._basketWindow = false
		makeAutoObservable(this)
	}
	setTypes(types) {
		this._types = types
	}
	setBrands(brands) {
		this._brands = brands
	}
	setDevices(devices) {
		this._devices = devices
	}
	setSelectedType(type) {
		this._selectedType = type
		this._page = 1
	}
	setSelectedBrand(brand) {
		this._selectedBrand = brand
		this._page = 1
	}
	setPage(page) {
		this._page = page
	}
	setTotalCount(count) {
		this._totalCount = count
	}
	setBasketCount(count) {
		this._basketCount = count
	}
	setBasketDevices(devices) {
		this._basketDevices = devices
	}
	setBasketWindow(boolean) {
		this._basketWindow = boolean
	}
	get types() {
		return this._types
	}
	get brands() {
		return this._brands
	}
	get devices() {
		return this._devices
	}
	get selectedType() {
		return this._selectedType
	}
	get selectedBrand() {
		return this._selectedBrand
	}
	get page() {
		return this._page
	}
	get limit() {
		return this._limit
	}
	get totalCount() {
		return this._totalCount
	}
	get basketCount() {
		return this._basketCount
	}
	get basketDevices() {
		return this._basketDevices
	}
	get basketWindow() {
		return this._basketWindow
	}
}
