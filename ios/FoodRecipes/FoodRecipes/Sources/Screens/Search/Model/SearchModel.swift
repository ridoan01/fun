//
//  SearchModel.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 19/10/21.
//

import Foundation


struct SearchSugestion{
	var key: String
}

extension SearchSugestion: Hashable{
	static var mock: [SearchSugestion] = [
		SearchSugestion(key: "america"),
		SearchSugestion(key: "antartica"),
		SearchSugestion(key: "antartica"),
		SearchSugestion(key: "australia"),
		SearchSugestion(key: "armenia"),
		SearchSugestion(key: "alaska"),
		SearchSugestion(key: "bangladesh"),
		SearchSugestion(key: "china"),
		SearchSugestion(key: "denmark"),
		SearchSugestion(key: "easter"),
		SearchSugestion(key: "finland"),
		SearchSugestion(key: "gamboa"),
		SearchSugestion(key: "honduras"),
		SearchSugestion(key: "jamaica"),
		SearchSugestion(key: "kenya"),
		SearchSugestion(key: "lisbon"),
	]
}
