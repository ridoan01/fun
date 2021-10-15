//
//  Comments.swift
//  PostFeed
//
//  Created by Ridoan Wibisono on 30/07/21.
//

import Foundation


struct Comments : Decodable, Hashable {
	var postId : Int
	var id : Int
	var name : String
	var email : String
	var body : String
}
