//
//  UserService.swift
//  JPH
//
//  Created by Ridoan Wibisono on 14/10/21.
//

import Foundation
import Combine

protocol UserProtocol{
	func fetchUsers() -> AnyPublisher<[User], Error>
}

struct UserService : UserProtocol{
	private var api: BaseService = BaseService()
	
	func fetchUsers() -> AnyPublisher<[User], Error> {
		api.load(url: URL(string: endpoint.baseUrl+"/users")!)
	}

}
