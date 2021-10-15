//
//  MovieListConfigurator.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 02/10/21.
//

import Foundation

final class MovieListConfigurator {
	public static func configureMovieListView(
		with viewModel: MovieListViewModel = MovieListViewModel()
	) -> MovieListView {
		let movieListView = MovieListView(model: viewModel)
		return movieListView
	}
}
