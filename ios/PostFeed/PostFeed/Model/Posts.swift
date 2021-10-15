//
//  Posts.swift
//  PostFeed
//
//  Created by Ridoan Wibisono on 30/07/21.
//

import Foundation

struct Posts : Codable, Hashable {
	var userId : Int
	var id : Int
	var title : String
	var body : String
	
}
