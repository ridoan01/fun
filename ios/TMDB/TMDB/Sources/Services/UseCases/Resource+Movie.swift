//
//  Resource+Movie.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 01/10/21.
//

import Foundation

extension Resource {
	static func movies() -> Resource<MovieListResponse>{
		let url = ApiConstants.baseUrl.appendingPathComponent("discover/movie")
		let parameters : [String : CustomStringConvertible] = [
			"api_key" : ApiConstants.apiKey,
			"language" : Locale.preferredLanguages[0]
		]
		return Resource<MovieListResponse>(url: url, parameters: parameters)
	}
	
	static func moreMovies(page: Int) -> Resource<MovieListResponse>{
		let url = ApiConstants.baseUrl.appendingPathComponent("discover/movie")
		let parameters : [String : CustomStringConvertible] = [
			"api_key" : ApiConstants.apiKey,
			"language" : Locale.preferredLanguages[0],
			"page": page
		]
		return Resource<MovieListResponse>(url: url, parameters: parameters)
	}
	
	static func movieDetail(id: Int) -> Resource<MovieDetail>{
		let url = ApiConstants.baseUrl.appendingPathComponent("movie/\(id)")
		let parameters : [String : CustomStringConvertible] = [
			"api_key" : ApiConstants.apiKey,
		]
		return Resource<MovieDetail>(url: url, parameters: parameters)
		
	}
}
