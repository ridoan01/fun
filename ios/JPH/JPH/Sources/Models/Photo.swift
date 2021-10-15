	//
	//  Photo.swift
	//  JPH
	//
	//  Created by Ridoan Wibisono on 12/10/21.
	//

import Foundation

struct Photo: Decodable{
	let albumId: Int
	let id: Int
	let title: String
	let url: String
	let thumbnailUrl: String
}

extension Photo{
	static let dummyPhotos: [Photo] = [
		Photo(albumId: 1, id: 1, title: "Photo title number 1", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"),
		Photo(albumId: 2, id: 2, title: "Photo title number 2", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"),
		Photo(albumId: 3, id: 3, title: "Photo title number 3", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"),
		Photo(albumId: 4, id: 4, title: "Photo title number 4", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"),
		Photo(albumId: 5, id: 5, title: "Photo title number 5", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"),
	]
}
