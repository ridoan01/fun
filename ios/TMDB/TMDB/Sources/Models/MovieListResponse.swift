//
//  MovieListResponse.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 01/10/21.
//

import Foundation

struct MovieListResponse : Codable {
	var page : Int
	var total_pages: Int
	var total_results : Int
	var results: [Movie]
}

