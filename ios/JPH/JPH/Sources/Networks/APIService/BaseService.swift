//
//  BaseService.swift
//  JPH
//
//  Created by Ridoan Wibisono on 13/10/21.
//

import Foundation
import Combine


final class BaseService{
	func load<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
		return URLSession.shared.dataTaskPublisher(for: url)
			.tryMap{ result in
				guard let httpResponse = result.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
					throw URLError(.badServerResponse)
				}
				return result.data
			}
			.receive(on: RunLoop.main)
			.decode(type: T.self, decoder: JSONDecoder())
			.eraseToAnyPublisher()
	}
}

