//
//  ServiceProvider.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 01/10/21.
//

import Foundation

class ServicesProvider {
	let network: NetworkServiceType
	
	init(network: NetworkServiceType) {
		self.network = network
	}
	
	static func defaultProvider() -> ServicesProvider{
		let network = NetworkService()
		
		return ServicesProvider(network: network)
	}
	
	
}
