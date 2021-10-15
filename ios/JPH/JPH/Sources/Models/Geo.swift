//
//  Geo.swift
//  JPH
//
//  Created by Ridoan Wibisono on 12/10/21.
//

import Foundation

struct Geo: Decodable{
	let lat: String
	let lng: String
}

extension Geo{
	static let dummyGeo = Geo(lat: "-37.3159", lng: "81.1496")
}
