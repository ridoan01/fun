//
//  UserDetailViewModel.swift
//  JPH
//
//  Created by Ridoan Wibisono on 14/10/21.
//

import Foundation
import Combine


class UserDetailViewModel: ObservableObject{
	
	private var userService: UserProtocol
	private var albumService: AlbumProtocol
	private var users = [User]()
	private var albums = [Album]()
	
	public var userId : Int
	var cancellables : Set<AnyCancellable> = []
	
	@Published var detail : UserDetailModel = UserDetailModel.userDetailModelDummy
	
	
	 init(userId: Int, userService: UserProtocol = UserService(), albumService: AlbumProtocol = AlbumService()){
		self.userId = userId
		self.userService = userService
		self.albumService = albumService
		fetch()
	}
	
	func fetch(){
		let user = userService.fetchUsers()
		let album = albumService.fetchAlbum()
		
		Publishers.Zip(user, album)
			.sink{ receiveCompletion in
				switch receiveCompletion{
				case .failure(let error):
					print(error)
				case .finished:
					break
				}
			} receiveValue: { (user, album) in
				self.users = user
				self.albums = album
				self.detailModel(user: user, album: album)
			}
			.store(in: &cancellables)
	}
	
	private func detailModel(user: [User], album: [Album]){
		var temp = UserDetailModel.userDetailModelDummy
		for i in user.indices{
			if userId == user[i].id{
				let user = user[i]
				let addr = user.address
				temp.id = user.id
				temp.username = user.username
				temp.name = user.name
				temp.email = user.email
				temp.phone = user.phone
				temp.website = user.website
				temp.address = "\(addr.street)\n\(addr.suite)\n\(addr.city)\n\(addr.zipcode)"
				
			}
		}
	
		
		for i in album.indices{
			if userId == album[i].userId{
				temp.album.append(album[i])
			}
		}
		
		detail = temp
	}
	
	
}
