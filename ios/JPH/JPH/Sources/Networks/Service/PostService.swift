//
//  PostService.swift
//  JPH
//
//  Created by Ridoan Wibisono on 14/10/21.
//

import Foundation
import Combine

protocol PostProtocol{
	func fecthPosts() -> AnyPublisher<[Post], Error>
	func fetchPost(id: Int) -> AnyPublisher<Post, Error>
}


struct PostService : PostProtocol{
	
	private var api: BaseService = BaseService()
	
	func fecthPosts() -> AnyPublisher<[Post], Error>{
		api.load(url: URL(string: endpoint.baseUrl+"/posts")!)
	}
	
	func fetchPost(id: Int) -> AnyPublisher<Post, Error> {
		api.load(url: URL(string: endpoint.baseUrl+"/posts/\(id)")!)
	}
	
}
