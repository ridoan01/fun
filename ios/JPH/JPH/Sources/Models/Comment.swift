	//
	//  Comment.swift
	//  JPH
	//
	//  Created by Ridoan Wibisono on 12/10/21.
	//

import Foundation

struct Comment: Decodable, Hashable{
	let postId: Int
	let id: Int
	let name: String
	let email: String
	let body: String
}

extension Comment{
	static let dummyComments: [Comment] = [
		Comment(postId: 1, id: 1, name: "commenter 1", email: "1_comment@gmai.com", body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"),
		Comment(postId: 2, id: 2, name: "commenter 2", email: "2_comment@gmai.com", body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"),
		Comment(postId: 3, id: 3, name: "commenter 3", email: "3_comment@gmai.com", body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"),
		Comment(postId: 4, id: 4, name: "commenter 4", email: "4_comment@gmai.com", body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"),
		Comment(postId: 5, id: 5, name: "commenter 5", email: "5_comment@gmai.com", body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
	]
}
