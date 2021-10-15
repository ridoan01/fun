//
//  MovieDetailConfigurator.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 02/10/21.
//

import Foundation

final class MovieDetailViewConfigurator{
	public static func configureMovieDetailView(
		with movieId: Int) -> MovieDetailView {
		let movieDetailView = MovieDetailView(model: MovieDetailViewModel(movieId: movieId))
		return movieDetailView
	}
}
