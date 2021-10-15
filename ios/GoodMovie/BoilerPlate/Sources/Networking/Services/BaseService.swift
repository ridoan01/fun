//
//  BaseService.swift
//  BoilerPlate
//
//  Created by Ridoan Wibisono on 06/10/21.
//

import Foundation
import Combine

enum ErrorResult: Error, Equatable {
	case invalidRequest
	case generalError(message: String?)
	case noInternet
	case dataNil
	case parsingFailure
	case dataLoadingError(statusCode: Int, data: Data)
}

class BaseService{
	
	func request<T: Codable>(urlString: String) -> AnyPublisher<T,Error>{
		let url = URL(string: urlString)!
		let urlRequest = URLRequest(url: url)
		return URLSession.shared.dataTaskPublisher(for: urlRequest)
			.mapError{ _ in ErrorResult.invalidRequest}
			.flatMap{ data, response -> AnyPublisher<Data, Error> in
				guard let response = response as? HTTPURLResponse else {
					return .fail(ErrorResult.invalidRequest)
				}
				
				guard 200..<300 ~= response.statusCode else {
					return .fail(ErrorResult.dataLoadingError(statusCode: response.statusCode, data: data))
				}
				
				return .just(data)
			}
			.decode(type: T.self, decoder: JSONDecoder())
			.eraseToAnyPublisher()
	}
}
