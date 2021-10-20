//
//  Category.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 19/10/21.
//

import Foundation
import SwiftUI

struct Category {
	var name: String
	var bgColor: Color
	var img: String?
}


extension Category : Hashable{
	static var categoryMock: [Category] = [
		Category(name: "Breakfast", bgColor: Color(UIColor(rgb: 0x007965))),
		Category(name: "Dessert", bgColor: Color(UIColor(rgb: 0xF58634))),
		Category(name: "Starter", bgColor: Color(UIColor(rgb: 0x74C7B8))),
		Category(name: "Seafood", bgColor: Color(UIColor(rgb: 0x045762))),
		Category(name: "Chicken", bgColor: Color(UIColor(rgb: 0xFF847C))),
		Category(name: "Beef", bgColor: Color(UIColor(rgb: 0xD35D6E))),
		Category(name: "Goat", bgColor: Color(UIColor(rgb: 0x864000))),
		Category(name: "Lamb", bgColor: Color(UIColor(rgb: 0xD57149))),
		Category(name: "Pasta", bgColor: Color(UIColor(rgb: 0xFF7A00))),
		Category(name: "Vegetarian", bgColor: Color(UIColor(rgb: 0x206A5D))),
		Category(name: "Side", bgColor: Color(UIColor(rgb: 0x96BB7C))),
		Category(name: "Vegan", bgColor: Color(UIColor(rgb: 0x81B214))),
		Category(name: "Pork", bgColor: Color(UIColor(rgb: 0xEE9595))),
		Category(name: "Miscellaneous", bgColor: Color(UIColor(rgb: 0x74C7B8)))
	]
}



struct BgColor{
	var bgColor: Color
}

extension BgColor{
	static var colorMock: [BgColor] = [
		BgColor(bgColor: Color(UIColor(rgb: 0x007965))),
		BgColor(bgColor: Color(UIColor(rgb: 0xF58634))),
		BgColor(bgColor: Color(UIColor(rgb: 0x74C7B8))),
		BgColor(bgColor: Color(UIColor(rgb: 0x045762))),
		BgColor(bgColor: Color(UIColor(rgb: 0xFF847C))),
		BgColor(bgColor: Color(UIColor(rgb: 0xD35D6E))),
		BgColor(bgColor: Color(UIColor(rgb: 0x864000))),
		BgColor(bgColor: Color(UIColor(rgb: 0xD57149))),
		BgColor(bgColor: Color(UIColor(rgb: 0xFF7A00))),
		BgColor(bgColor: Color(UIColor(rgb: 0x206A5D))),
		BgColor(bgColor: Color(UIColor(rgb: 0x96BB7C))),
		BgColor(bgColor: Color(UIColor(rgb: 0x81B214))),
		BgColor(bgColor: Color(UIColor(rgb: 0xEE9595))),
		BgColor(bgColor: Color(UIColor(rgb: 0x74C7B8)))
	]
}
