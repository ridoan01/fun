//
//  MovieListRoute.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 02/10/21.
//

import SwiftUI

final class MovieListRouter{
	public static func destinationForTappedMovie(movieId : Int) -> some View {
		return MovieDetailViewConfigurator.configureMovieDetailView(with: movieId)
	}
}
