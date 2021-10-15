//
//  Album.swift
//  JPH
//
//  Created by Ridoan Wibisono on 12/10/21.
//

import Foundation

struct Album: Decodable, Hashable{
	let userId: Int
	let id: Int
	let title: String
}

extension Album{
	static let dummyAlbums: [Album] = [
		Album(userId: 1, id: 1, title: "quidem molestiae enim"),
		Album(userId: 2, id: 2, title: "quidem molestiae enim"),
		Album(userId: 3, id: 3, title: "quidem molestiae enim"),
		Album(userId: 4, id: 4, title: "quidem molestiae enim"),
		Album(userId: 5, id: 5, title: "quidem molestiae enim")
	]
}
