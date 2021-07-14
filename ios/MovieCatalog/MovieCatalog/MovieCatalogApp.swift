//
//  MovieCatalogApp.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 07/07/21.
//

import SwiftUI

@main
struct MovieCatalogApp: App {
    var body: some Scene {
        WindowGroup {
//            MovieDetailView()
            
            TabView{
                Home()
                    .tabItem {
                        Label("Home", systemImage: "house")

                    }
                ContentView()
                    .tabItem {
                        Label("Other", systemImage: "sunrise")
                    }
            }
            
        }
    }
}
