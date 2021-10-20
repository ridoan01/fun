//
//  StringModifiers.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 20/10/21.
//

import Foundation

extension String {
	func capitalizingFirstLetter() -> String {
		return prefix(1).capitalized + dropFirst()
	}
	
	mutating func capitalizeFirstLetter() {
		self = self.capitalizingFirstLetter()
	}
}
