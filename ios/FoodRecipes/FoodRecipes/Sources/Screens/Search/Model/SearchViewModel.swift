//
//  SearchViewModel.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 19/10/21.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject{
	
	@Published var predictableValues = [String]()
	
	
	init(){
		defaultSuggestions()
	}
	
	
	func search(maching: String){
		
	}
	
	func defaultSuggestions(){
		let arr: [SearchSugestion] = SearchSugestion.mock
		
		for i in arr.indices{
			predictableValues.append(arr[i].key.capitalizingFirstLetter())
		}
	}
	
	func getSuggesstions() -> [String]{
		
		let arr: [SearchSugestion] = SearchSugestion.mock
		var temp = [String]()
		for i in arr.indices{
			temp.append(arr[i].key)
		}
		
		return temp
	}
	
}



