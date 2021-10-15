//
//  MovieList.swift
//  BoilerPlate
//
//  Created by Ridoan Wibisono on 06/10/21.
//

import Foundation

struct MovieList: Codable {
	//    #warning("FIX ME")
	var result : [Movie]
	var page : String
	var length : String
}

struct Movie: Codable {
	//    #warning("FIX ME")
	var movieId : String
	var title : String
	var thumbnailPotrait : String
	var rating : String
	var detail : Detail
}

struct Detail: Codable {
	//    #warning("FIX ME")
	var genre : String
	var release : String
	var description : String
	var thumbnailLandscape : String
}

