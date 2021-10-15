//
//  PostDetailViewModel.swift
//  JPH
//
//  Created by Ridoan Wibisono on 15/10/21.
//

import Foundation
import Combine
import UIKit

class PostDetailViewModel : ObservableObject{
	private var postService : PostProtocol
	private var userService : UserProtocol
	private var commentService : CommentProtocol
	
	var postId : Int
	var cancellables : Set<AnyCancellable> = []
	
	@Published var comments = [Comment]()
	@Published var post = Post.dummyPost
	@Published var user = User.dummyUser
	
	init(postId: Int, postService: PostProtocol = PostService(),
		 userService: UserProtocol = UserService(),
		 commentService: CommentProtocol = CommentService()){
		
		self.postId = postId
		self.postService = postService
		self.userService = userService
		self.commentService = commentService
		fetch()
	}
	
	
	func fetch(){
		let post = postService.fetchPost(id: postId)
		let comments = commentService.fetchComment(postId: postId)
		let users = userService.fetchUsers()
		
		Publishers.Zip3(post, comments, users)
			.sink{ completion in
				switch completion{
				case .failure(let error):
					print(error)
				case .finished:
					break
				}
			}
		receiveValue : { (post, comments, users) in
			self.post = post
			self.comments = comments
			self.getUser(users: users)
			
			print(post)
		}
		.store(in: &cancellables)
	}
	
	private func getUser(users: [User]){
		for i in users.indices {
			if post.userId == users[i].id{
				user = users[i]
			}
		}
	}
}
