//
//  Publisher+Utils.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 01/10/21.
//

import Foundation
import Combine


extension Publisher {
	static func empty() -> AnyPublisher<Output, Failure>{
		return empty().eraseToAnyPublisher()
	}
	
	static func just(_ output: Output) -> AnyPublisher<Output, Failure>{
		return Just(output)
			.catch{ _ in AnyPublisher<Output, Failure>.empty()}
			.eraseToAnyPublisher()
	}
	
	static func fail(_ error: Failure) -> AnyPublisher<Output, Failure>{
		return Fail(error: error).eraseToAnyPublisher()
	}
}
