//
//  PostScreen.swift
//  JPH
//
//  Created by Ridoan Wibisono on 13/10/21.
//

import SwiftUI

struct PostScreen: View {
	@StateObject var model = PostViewModel()
	
	@State var isActive = false
	

	
	var body: some View {
		
		NavigationView{
			VStack(alignment:.leading){
				ScrollView(.vertical, showsIndicators: false){
					ForEach (model.modelPost, id: \.self){ post in
						postList(post)
						
					}
				}
			}
			.navigationViewStyle(.stack)
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .principal){
					Text("Post")
				}
//				ToolbarItem(placement: .navigationBarLeading){
//					Button("Back", action: {})
//				}
//				ToolbarItem(placement: .navigationBarTrailing){
//					Button("Next", action: {})
//				}
				
			}
		}
		
	}
}

struct PostScreen_Previews: PreviewProvider {
	static var previews: some View {
		PostScreen()
	}
}


extension PostScreen{
	fileprivate func postList(_ post: PostModel) -> some View {
		return ZStack{
			NavigationLink(destination: { PostDetailScreen(model: PostDetailViewModel(postId: post.id)) },
						   label: {
				HStack(alignment: .center, spacing: 8){
					VStack(alignment: .leading, spacing: 4){
						Text(post.title)
							.font(.headline)
							.foregroundColor(Color.white)
							.lineLimit(1)
						
						NavigationLink(destination: { UserDetailScreen(model: UserDetailViewModel(userId: post.userId)) },
									   label: {
							Text(post.userName)
								.font(.subheadline)
								.foregroundColor(Color.white)
								.lineLimit(1)
						})
					}
					.padding()
					Spacer()
					
					Image(systemName: "chevron.forward")
						.resizable()
						.foregroundColor(Color.white)
						.frame(width: 10, height: 20, alignment: .center)
						.aspectRatio(contentMode: .fit)
						.padding()
				}
				.aspectRatio(contentMode: .fit)
			})
				.background(Color(UIColor.systemTeal))
				.cornerRadius(8)
			
		}
		.padding(.horizontal, 20)
		.padding(.vertical, 2)
	}
}
