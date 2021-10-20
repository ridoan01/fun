//
//  FoodRecipesApp.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import SwiftUI

@main
struct FoodRecipesApp: App {
    var body: some Scene {
        WindowGroup {
			CustomTabBar(model: CustomTabBarViewModel())
        }
    }
}
