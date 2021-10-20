//
//  TabBarModel.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import Foundation
import SwiftUI

struct TabBarModel: Decodable, Hashable{
	var id : Int
	var title : String
	var icon : String
}

extension TabBarModel{
	static var tabs: [TabBarModel] = [ TabBarModel(id: 1, title: "Home", icon: "house"),
									   TabBarModel(id: 2, title: "Likes", icon: "heart"),
									   TabBarModel(id: 3, title: "Search", icon: "magnifyingglass"),
									   TabBarModel(id: 4, title: "Categories", icon: "rectangle.stack"),
									   TabBarModel(id: 5, title: "Account", icon: "person"),
	]
}
