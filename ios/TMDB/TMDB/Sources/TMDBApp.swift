//
//  TMDBApp.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 30/09/21.
//

import SwiftUI

@main
struct TMDBApp: App {
    var body: some Scene {
        WindowGroup {
			MovieListConfigurator.configureMovieListView()
        }
    }
}
