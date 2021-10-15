//
//  UserDetailModel.swift
//  JPH
//
//  Created by Ridoan Wibisono on 14/10/21.
//

import Foundation

struct UserDetailModel : Decodable{
	var id: Int
	var username: String
	var name: String
	var email: String
	var phone: String
	var website: String
	var address: String
	var album: [Album]
	
}

extension UserDetailModel{
	static var userDetailModelDummy = UserDetailModel(id: 1, username: "bret",name: "john", email: "random@mail.co", phone: "1232545", website: "www.site.co",
													  address: "Address",
													  album: [])
}
