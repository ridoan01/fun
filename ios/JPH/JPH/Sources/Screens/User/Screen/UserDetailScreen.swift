//
//  UserDetailScreen.swift
//  JPH
//
//  Created by Ridoan Wibisono on 14/10/21.
//

import SwiftUI

struct UserDetailScreen: View {
	@StateObject var model : UserDetailViewModel
	
	 var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false){
			VStack(alignment: .leading, spacing: 10){
				Image("photo")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 4, alignment: .center)
					.overlay(
						HStack{
							Text(model.detail.name)
								.font(.title3)
								.foregroundColor(Color.white)
						}
							.frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
						
							.background(Color.black.opacity(0.5))
						, alignment: .bottom
					)
					.cornerRadius(8)
				
				
				VStack(alignment: .leading, spacing: 8){
					
					HStack(alignment: .center , spacing: 8){
						Image(systemName: "envelope")
						Text("\(model.detail.email)")
						.font(.callout)
					}
					HStack(alignment: .center , spacing: 8){
						Image(systemName: "phone")
						Text("\(model.detail.phone)")
						.font(.callout)
					}
					
					HStack(alignment: .center , spacing: 8){
						Image(systemName: "network")
						Text("www.\(model.detail.website)")
						.font(.callout)
					}
					
					HStack(alignment: .top , spacing: 8){
						Image(systemName: "pin")
						Text("\(model.detail.address)")
							.font(.callout)
					}
				}
				
				VStack(alignment: .leading){
					Text("Album")
					ScrollView(.vertical, showsIndicators: false){
						LazyVGrid(columns: gridItemLayout, spacing: 8){
							ForEach (model.detail.album, id: \.self)  { album in
								NavigationLink(destination: Text("\(album.id)")){
								
								VStack(alignment: .center, spacing: 2){
									Image("photo")
										.resizable()
										.frame(width: 100, height: 80, alignment: .top)
										.overlay(
											HStack(alignment: .center){
												Spacer()
												Text("\(album.title)")
													.font(.callout)
													.foregroundColor(Color.white)
												Spacer()
											}
												.background(Color.black.opacity(0.5))
												.frame(width: 100, height: 30, alignment: .bottom)
											,
											alignment: .bottom
										)
									
								}
								.background(Color.gray)
								.cornerRadius(8)
								}
							}
						}
					}
				}
			}
			.padding()
		}
		.navigationViewStyle(.stack)
		.navigationBarTitleDisplayMode(.inline)
		.toolbar{
			ToolbarItem(placement: .principal){
				Text("User Detail")
				
			}
		}
	}
}

struct UserDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
		UserDetailScreen(model: UserDetailViewModel(userId: 1))
    }
}
