//
//  PostViewModel.swift
//  JPH
//
//  Created by Ridoan Wibisono on 14/10/21.
//

import Foundation
import Combine


class PostViewModel : ObservableObject{
	let postService : PostProtocol
	let userService : UserProtocol
	
	var cancellables : Set<AnyCancellable> = []
	
	@Published var posts = [Post]()
	@Published var users = [User]()
	@Published var modelPost =  [PostModel]()
	
	init(postService: PostProtocol = PostService(), userService : UserProtocol = UserService()){
		self.postService = postService
		self.userService = userService
		fetchData()
	}
	
	func reload(){
		fetchData()
	}
	
	private func fetchData(){
		let post = postService.fecthPosts()
		let user = userService.fetchUsers()
		
		Publishers.Zip(post, user)
			.sink { receiveCompletion in
				switch receiveCompletion {
				case .failure(let error):
					print(error)
				case .finished:
					print("finished")
					break
				}
				
			} receiveValue: { (post, user) in
				self.posts = post
				self.users = user
				self.setupPost(post: post, user: user)
			}
			.store(in: &cancellables)
	}
	
	
	private func setupPost(post: [Post], user: [User]){
		var temp: [PostModel] = []
		for i in posts.indices{
			temp.append(PostModel(id: posts[i].id, title: posts[i].title, body: post[i].body, userId: posts[i].userId, userName: ""))
			for item in user.indices {
				if temp[i].userId == user[item].id {
					temp[i].userName = user[item].name
				}
			}
		}
		modelPost = temp
	}
	
}


