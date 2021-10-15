//
//  UserScreenViewModel.swift
//  JPH
//
//  Created by Ridoan Wibisono on 15/10/21.
//

import Foundation
import Combine

class UserScreenViewModel: ObservableObject{
	private var userService: UserProtocol
	private var postService: PostProtocol
	
	private var users = [User]()
	private var posts = [Post]()
	
	@Published var userPosts = [UserPostModel]()
	
	var cancellables : Set<AnyCancellable> = []
	
	init(userService: UserProtocol = UserService(), postService: PostProtocol = PostService()){
		self.userService = userService
		self.postService = postService
		fetch()
	}

	private func fetch(){
		let users = userService.fetchUsers()
		let posts = postService.fecthPosts()
		
		Publishers.Zip(users, posts)
			.sink{ receiveCompletion in
				switch receiveCompletion {
				case .failure(let error):
					print(error)
				case .finished:
					break
				}
			}receiveValue: { (users, posts) in
				self.users = users
				self.posts = posts
				self.buildModel(user: users, post: posts)
			}
			.store(in: &cancellables)
	}
	
	func buildModel(user: [User], post: [Post]){
		var temp: [UserPostModel] = []
		
		for i in user.indices{
			
			temp.append(UserPostModel(id: user[i].id, name: user[i].name, post: []))
			for j in post.indices{
				if temp[i].id == post[j].userId{
					temp[i].post.append(post[j])
				}
			}
		}
		userPosts = temp
	}
}

struct UserPostModel : Decodable, Hashable{
	var id: Int
	var name: String
	var post: [Post]
}


extension UserPostModel{
	static var dummyUserComentModels: [UserPostModel] = [
		UserPostModel(id: 1, name: "", post: Post.dummyPosts)
	]
}


