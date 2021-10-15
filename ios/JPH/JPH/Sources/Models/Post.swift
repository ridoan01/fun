	//
	//  Post.swift
	//  JPH
	//
	//  Created by Ridoan Wibisono on 12/10/21.
	//

import Foundation

struct Post: Decodable, Hashable{
	let userId: Int
	let id: Int
	let title: String
	let body: String
}

extension Post{
	static let dummyPosts: [Post] = [
		Post(userId: 1, id: 1, title: "Dummy Post Title 1", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto."),
		Post(userId: 2, id: 2, title: "Dummy Post Title 2", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto."),
		Post(userId: 3, id: 3, title: "Dummy Post Title 3", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto."),
		Post(userId: 4, id: 4, title: "Dummy Post Title 4", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto."),
		Post(userId: 5, id: 5, title: "Dummy Post Title 5", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto.")
	]
	
	static var dummyPost : Post = Post(userId: 1, id: 1, title: "Dummy Post Title 1", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto.")
}

