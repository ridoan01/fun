//
//  HomeScreen.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import SwiftUI

struct HomeScreen: View {
	let columns = [
		GridItem(.adaptive(minimum: 150), spacing: 12)
	]
	var body: some View {
		NavigationView{
			ScrollView(.vertical, showsIndicators: false){
				VStack{
					LazyVGrid(columns: columns){
						ForEach(0..<15, id: \.self) { item in
							
							NavigationLink(destination: MealDetailScreen(), label: {
								VStack(alignment: .center, spacing: 2){
									Image("mealSmall")
										.resizable()
										.frame(minWidth: 150, minHeight: 150, alignment: .center)
										.aspectRatio(1, contentMode: .fit)
									
									Text("Rendang Goreng Balado pedas manis")
										.font(.callout)
										.lineLimit(1)
										.foregroundColor(Color(UIColor.label))
									
								}
								.cornerRadius(12)
							})
							
						}
					}
					
				}
				.padding()
			}
			.navigationBarTitleDisplayMode(.inline)
			.toolbar{
				ToolbarItem(placement: .principal, content: {
					Text("Home")
						.font(.title.bold())
				})
			}
		}
	}
}

struct HomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreen()
	}
}
