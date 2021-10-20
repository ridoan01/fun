//
//  CustomTabBar.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import SwiftUI

struct CustomTabBar: View {
	@State var selectedIndex = 1
	@StateObject var model : CustomTabBarViewModel
	
	
	var body: some View {
		VStack{
			ZStack{
				switch selectedIndex{
				case 1:
					HomeScreen()
				case 2:
					LikeScreen()
				case 3:
					SearchScreen()
				case 4:
					CategoryScreen()
				case 5:
					AccountScreen()
				default:
					HomeScreen()
				}
			}
			Spacer()
			Divider()
			tabItems()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		CustomTabBar(model: CustomTabBarViewModel()).preferredColorScheme(.light)
	}
}


extension CustomTabBar  {
	
	fileprivate func tabItems() -> some View {
		return HStack{
			ForEach(model.tabItem, id: \.self){ num in
				Spacer()
				Button(action: {selectedIndex = num.id },
					   label:{
					VStack(alignment: .center, spacing: 0){
						Image(systemName: "\(num.icon)")
							.font(.title3)
							.foregroundColor(selectedIndex == num.id ? Color(UIColor.systemTeal) : Color(UIColor.label))
							.padding(.bottom, 4)
						
						Text("\(num.title)")
							.font(.footnote)
							.foregroundColor(selectedIndex == num.id ? Color(UIColor.systemTeal) : Color(UIColor.label))
						
					}
				})
				Spacer()
			}
		}
		.frame(width: UIScreen.main.bounds.width, height: 60, alignment: .center)
		.background(Color(UIColor.systemBackground).opacity(0.5))
	}
	
	
}
