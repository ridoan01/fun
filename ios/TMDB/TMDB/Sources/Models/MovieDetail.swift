//
//  MovieDetail.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 02/10/21.
//

import Foundation
struct MovieDetail : Codable {
	var adult : Bool
	var backdrop_path : String = ""
	var belongs_to_collection : BelongToCollection?
	var budget : Double?
	var genres : [Genre]?
	var homepage : String = ""
	var id : Int
	var imdb_id : String = ""
	var original_language : String = ""
	var original_title : String = ""
	var overview : String = ""
	var popularity : Float?
	var poster_path : String?
	var production_companies : [ProductionCompany]?
	var production_countries : [ProductionCountry]?
	var release_date : String = ""
	var revenue : Float?
	var runtime : Int?
	var spoken_languages : [SpokenLanguage]?
	var status : String = ""
	var tagline : String = ""
	var title : String = ""
	var video : Bool = false
	var vote_average : Float?
	var vote_count : Int?
}

extension MovieDetail{
	static func fakeMovieDetail() -> Self{
		return MovieDetail(adult: false, backdrop_path: "", belongs_to_collection: BelongToCollection.fakeBelong(), budget: 1, genres: [], homepage: "", id: 1, imdb_id: "", original_language: "", original_title: "", overview: "", popularity: 1, poster_path: "", production_companies: [], production_countries: [], release_date: "", revenue: 1, runtime: 1, spoken_languages: [], status: "", tagline: "", title: "", video: false, vote_average: 1, vote_count: 1)
	}
}


extension BelongToCollection{
	static func fakeBelong()->Self{
		return BelongToCollection(id: 1, name: "", poster_path: "", backdrop_path: "")
	}
}
