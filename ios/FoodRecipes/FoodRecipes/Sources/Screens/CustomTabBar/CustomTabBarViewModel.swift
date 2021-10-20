//
//  CustomTabBarViewModel.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import Foundation


class CustomTabBarViewModel: ObservableObject{
	
	@Published var tabItem: [TabBarModel] = TabBarModel.tabs
	
}

