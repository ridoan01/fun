//
//  Address.swift
//  JPH
//
//  Created by Ridoan Wibisono on 12/10/21.
//

import Foundation

struct Address: Decodable{
	let street: String
	let suite: String
	let city: String
	let zipcode: String
	let geo: Geo
	
}

extension Address{
	static let dummyAddress = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: Geo.dummyGeo)
}
