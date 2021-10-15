//
//  Photos.swift
//  PostFeed
//
//  Created by Ridoan Wibisono on 30/07/21.
//

import Foundation

struct Photos : Codable, Hashable {
	var albumId : Int
	var id : Int
	var title : String
	var url : String
	var tumbnailUrl : String
}
