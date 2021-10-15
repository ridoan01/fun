//
//  PostDetailScreen.swift
//  JPH
//
//  Created by Ridoan Wibisono on 14/10/21.
//

import SwiftUI


struct PostDetailScreen: View {
	@StateObject var model : PostDetailViewModel
	
	var body: some View {
			ScrollView(.vertical, showsIndicators: false){
				VStack(alignment: .leading, spacing: 8){
					Image("photo")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 4, alignment: .center)
						.overlay(
							HStack{
								Text("image source: www.google.com")
									.font(.footnote)
									.foregroundColor(Color.white)
							}
								.frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
							
								.background(Color.black.opacity(0.5))
							, alignment: .bottom
						)
						.cornerRadius(8)
					
					Text(model.post.title)
						.font(.headline)
					
					HStack{
						Text("Author :")
							.font(.footnote)
						NavigationLink(destination: UserDetailScreen(model: UserDetailViewModel(userId: model.user.id))){
							Text(model.user.username)
								.font(.footnote.italic())
						}
					}
					Text(model.post.body)
						.font(.body)
					
					
					VStack(alignment: .leading, spacing: 2){
						Text("Comments")
							.font(.subheadline)
						
						ForEach(model.comments, id: \.self) { cmnt in
							
								Text("\(cmnt.name)")
									.font(.callout)
								Text("( \(cmnt.email) )")
									.font(.footnote.weight(.light))
							
								Text("\(cmnt.body)")
								.font(.footnote)
								.padding(.leading, 20)
								.padding(.bottom, 10)
						}
					}
					.padding()
				}
				.padding()
			}
			.navigationViewStyle(.stack)
			.navigationBarTitleDisplayMode(.inline)
			.toolbar{
				ToolbarItem(placement: .principal){ Text("Post Detail")}
			}
		}
		
}

struct PostDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
		PostDetailScreen(model: PostDetailViewModel(postId: 1))
    }
}
