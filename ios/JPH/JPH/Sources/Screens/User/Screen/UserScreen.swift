//
//  UserScreen.swift
//  JPH
//
//  Created by Ridoan Wibisono on 15/10/21.
//

import SwiftUI

struct UserScreen: View {
	@StateObject var model: UserScreenViewModel
	
	var body: some View {
		NavigationView{
			VStack(alignment: .leading, spacing: 8){
				ScrollView(.vertical, showsIndicators: false){
					HStack(alignment: .center){
						VStack(alignment: .leading){
							ForEach(model.userPosts, id:\.self) { user in
								NavigationLink(destination: UserDetailScreen(model: UserDetailViewModel(userId: user.id)), label: {
									Text("\(user.name)")
										.font(.headline)
								})
								ForEach(user.post, id:\.self){ pst in
									NavigationLink(destination: PostDetailScreen(model: PostDetailViewModel(postId: pst.id)), label: {
										
										HStack(alignment: .center){
											
											Image(systemName: "pencil.circle")
												.resizable()
												.frame(width: 20, height: 20, alignment: .center)
												.foregroundColor(Color.gray)
											
											Text("\(pst.title)")
												.font(.callout)
												.lineLimit(1)
												.padding(.vertical, 2)
										}
										
										
									})
									
								}
								Spacer()
							}
						}
						Spacer()
					}
					
				}
				.padding()
			}
			
			.navigationViewStyle(.stack)
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .principal){
					Text("Users")
				}
			}
		}
		
	}
}

struct UserScreen_Previews: PreviewProvider {
    static var previews: some View {
		UserScreen(model: UserScreenViewModel())
    }
}
