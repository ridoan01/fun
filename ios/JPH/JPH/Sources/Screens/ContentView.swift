//
//  ContentView.swift
//  JPH
//
//  Created by Ridoan Wibisono on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		TabView{
			UserScreen(model: UserScreenViewModel())
				.tabItem{
					Label("Users", systemImage: "person.3")
			}
			
			PostScreen()
				.tabItem{
					Label("Posts", systemImage: "book")
				
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
