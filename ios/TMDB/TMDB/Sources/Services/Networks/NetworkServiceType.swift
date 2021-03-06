//
//  NetworkServiceType.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 01/10/21.
//

import Foundation
import Combine

protocol NetworkServiceType : AnyObject {
	
	func Load<T>(_ resource: Resource<T>) -> AnyPublisher<T,Error>
}

enum NetworkError : Error{
	case invalidRequest
	case invalidResponse
	case dataLoadingError(statusCode: Int, data: Data)
	case jsonDecodingError(error: Error)
}
