//
//  PostModel.swift
//  JPH
//
//  Created by Ridoan Wibisono on 14/10/21.
//

import Foundation

struct PostModel : Decodable, Hashable {
	var id: Int
	var title: String
	var body: String
	var userId: Int
	var userName: String
}

extension PostModel{
	static let dummyPostModel: PostModel = PostModel(id: 1,
													 title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
													 body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
													 userId: 1,
													 userName: "Bret")
}
