//
//  ContentView.swift
//  GoodMovie
//
//  Created by Ridoan Wibisono on 03/10/21.
//

import SwiftUI

struct ContentView: View {
	@State private var selection = 0
    var body: some View {
		TabView(selection: $selection){
			Home()
				.tabItem {
					Image(systemName: selection == 0 ? "house.fill" :"house")
					Text("Home")
				}
				.tag(0)
				
			Text("TV Show")
				.tabItem {
					Image(systemName: "tv")
					Text("TV Show")
				}
				.tag(1)
			
			Movies()
				.tabItem {
					Image(systemName: "film")
					Text("Movies")
				}
				.tag(2)
			
			Text("Like")
				.tabItem {
					Image(systemName: selection == 3 ? "heart.fill" : "heart" )
						.foregroundColor(selection == 3 ? .red : .primary)
					Text("Like")
				}
				.tag(3)
			Text("Settings")
				.tabItem {
					Image(systemName: "gear")
					Text("Settings")
				}
				.tag(4)
		}
		.onAppear(){
			UITabBar()
				.tintColor = .white
		}
		.accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			ContentView().colorScheme(.light)
		}
    }
}
