//
//  SearchScreen.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import SwiftUI

struct SearchScreen: View {
	@StateObject private var viewModel = SearchViewModel()
	@State private var query = ""
	@State var textFieldInput: String = ""
		//	@State var predictableValues: Array<String> = ["First", "Second", "Third", "Fourth"]
	@State var predictedValue: Array<String> = []
	
	var body: some View {
		NavigationView{
			VStack(alignment: .leading){
				ScrollView(.vertical, showsIndicators: false){
					VStack(alignment: .leading, spacing: 4){
						ForEach(self.predictedValue, id: \.self){ value in
							
							HStack(alignment: .center){
								Text("Are you looking for")
								NavigationLink(destination: Text(value), label: {
									Text("\(value)")
								})
								Text("?")
									.padding(.leading, -10)
								Spacer()
							}
							
						}
						
					}
					.background(Color(UIColor.white))
					.cornerRadius(8)
				}
				
				if self.predictedValue.isEmpty{
					ScrollView(.vertical, showsIndicators: false){
						VStack{
							Text("How")
						}
					}
				}
				
			}.padding()
				.navigationBarTitleDisplayMode(.inline)
				.toolbar{
					ToolbarItem(placement: .principal, content: {
						PredictingTextField(predictableValues: $viewModel.predictableValues, predictedValues: self.$predictedValue, textFieldInput: self.$textFieldInput)
							.padding(.leading, 10)
						
					})
					
					ToolbarItem(placement: .navigationBarTrailing, content: {
						Image(systemName: "slider.horizontal.3")
							.foregroundColor(Color(UIColor.secondaryLabel))
					})
				}
		}
		
	}
}

struct SearchScreen_Previews: PreviewProvider {
	static var previews: some View {
		SearchScreen()
	}
}



