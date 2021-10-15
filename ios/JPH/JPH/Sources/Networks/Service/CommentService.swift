//
//  CommentService.swift
//  JPH
//
//  Created by Ridoan Wibisono on 15/10/21.
//

import Foundation
import Combine

protocol CommentProtocol{
	func fetchComment(postId: Int) ->AnyPublisher<[Comment], Error>
}

struct CommentService : CommentProtocol{
	private var api : BaseService = BaseService()
	
	func fetchComment(postId: Int) -> AnyPublisher<[Comment], Error> {
		api.load(url: URL(string: endpoint.baseUrl+"/posts/\(postId)/comments")!)
	}
}
