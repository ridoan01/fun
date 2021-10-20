//
//  CategoryScreen.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import SwiftUI

struct CategoryScreen: View {
	var body: some View {
		NavigationView{
			ScrollView(.vertical, showsIndicators: false){
				VStack{
					ForEach(Category.categoryMock, id:\.self){ cat in
						NavigationLink(destination: Text(cat.name), label: {
							HStack{
								Image("mealSmall")
									.resizable()
									.frame(width: 80, height: 80, alignment: .center)
									.aspectRatio(1, contentMode: .fit)
									.cornerRadius(8)
									.padding(8)
								
								Spacer()
								Text(cat.name)
									.font(.title)
									.foregroundColor(Color(UIColor.white))
									.padding(20)
							}
							.background(cat.bgColor)
							.cornerRadius(8)
						})
					}
				}
				.padding()
				.navigationBarTitleDisplayMode(.inline)
				.toolbar{
					ToolbarItem(placement: .principal, content: {
						Text("Category")
							.font(.title.bold())
					})
				}
			}
		}
	}
}

struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
    }
}
