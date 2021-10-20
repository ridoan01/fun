//
//  AccountScreen.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import SwiftUI

struct AccountScreen: View {
    var body: some View {
		NavigationView{
			VStack{
				Text("Account")
			}
			.toolbar{
				ToolbarItem(placement: .principal, content: {
					Text("Account")
				})
			}
		}
    }
}

struct AccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen()
    }
}
