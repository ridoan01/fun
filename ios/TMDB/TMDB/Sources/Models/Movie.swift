//
//  Movie.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 30/09/21.
//

import Foundation

struct Movie : Codable, Hashable {
	var adult : Bool
	var backdrop_path : String
	var genre_ids : [Int]
	var id : Int
	var original_language : String
	var overview : String
	var popularity : Float
	var poster_path : String
	var release_date : String
	var title : String
	var video : Bool
	var vote_average : Float
	var vote_count : Int
}



struct BelongToCollection : Codable {
	var id : Int?
	var name : String = ""
	var poster_path : String = ""
	var backdrop_path : String = ""
	
	
}

struct ProductionCompany : Codable {
	var id : Int?
	var logo_path : String = ""
	var name : String = ""
	var origin_country : String = ""
}

struct ProductionCountry : Codable{
	var iso_3166_1 : String = ""
	var name : String = ""
}

struct SpokenLanguage : Codable {
	var english_name : String = ""
	var iso_639_1 : String = ""
	var name : String = ""
}
