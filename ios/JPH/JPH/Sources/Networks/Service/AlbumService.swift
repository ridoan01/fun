//
//  AlbumService.swift
//  JPH
//
//  Created by Ridoan Wibisono on 14/10/21.
//

import Foundation
import Combine

protocol AlbumProtocol{
	func fetchAlbum() -> AnyPublisher<[Album],Error>
}

struct AlbumService : AlbumProtocol{
	private var api : BaseService = BaseService()
	
	func fetchAlbum() -> AnyPublisher<[Album], Error> {
		api.load(url: URL(string: endpoint.baseUrl+"/albums")!)
	}
	
	
}
