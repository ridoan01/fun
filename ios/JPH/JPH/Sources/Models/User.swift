	//
	//  User.swift
	//  JPH
	//
	//  Created by Ridoan Wibisono on 12/10/21.
	//

import Foundation

struct User: Decodable{

	
	let id: Int
	let username: String
	let name: String
	let email: String
	let phone: String
	let website: String
	let address: Address
	let company: Company
}

extension User : Hashable{
	static func == (lhs: User, rhs: User) -> Bool {
	return lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

extension User{
	static let dummyUsers: [User] = [
		User(id: 1, username: "username1", name: "User Name 1", email: "1_email@gmail.com", phone: "92998-0001", website: "www.username1.com", address: Address.dummyAddress, company: Company.dummyCompany),
		User(id: 2, username: "username2", name: "User Name 2", email: "2_email@gmail.com", phone: "92998-0002", website: "www.username2.com", address: Address.dummyAddress, company: Company.dummyCompany),
		User(id: 3, username: "username3", name: "User Name 3", email: "3_email@gmail.com", phone: "92998-0003", website: "www.username3.com", address: Address.dummyAddress, company: Company.dummyCompany),
		User(id: 4, username: "username4", name: "User Name 4", email: "4_email@gmail.com", phone: "92998-0004", website: "www.username4.com", address: Address.dummyAddress, company: Company.dummyCompany),
		User(id: 5, username: "username5", name: "User Name 5", email: "5_email@gmail.com", phone: "92998-0005", website: "www.username5.com", address: Address.dummyAddress, company: Company.dummyCompany),
	]
	
	static var dummyUser : User = User(id: 1, username: "username1", name: "User Name 1", email: "1_email@gmail.com", phone: "92998-0001", website: "www.username1.com", address: Address.dummyAddress, company: Company.dummyCompany)
}


