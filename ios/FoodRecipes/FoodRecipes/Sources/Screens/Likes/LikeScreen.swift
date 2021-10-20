//
//  LikeScreen.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import SwiftUI

struct LikeScreen: View {
    var body: some View {
		NavigationView{
			VStack{
				Text("Like")
			}
			.toolbar{
				ToolbarItem(placement: .principal, content: {
					Text("Like")
				})
			}
		}
    }
}

struct LikesScreen_Previews: PreviewProvider {
    static var previews: some View {
        LikeScreen()
    }
}
