//
//  Company.swift
//  JPH
//
//  Created by Ridoan Wibisono on 12/10/21.
//

import Foundation

struct Company: Decodable{
	let name: String
	let catchPhrase: String
	let bs: String
}

extension Company{
	static let dummyCompany = Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")
}
