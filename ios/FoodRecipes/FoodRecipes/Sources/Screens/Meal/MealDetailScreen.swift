//
//  MealDetailScreen.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 17/10/21.
//

import SwiftUI

struct MealDetailScreen: View {
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>
	@State private var showModal = false
	var body: some View {
		
		ScrollView(.vertical, showsIndicators: false){
			VStack(alignment: .center, spacing: 0){
				Image("mealLarge")
					.resizable()
					.aspectRatio(1, contentMode: .fit)
					.frame(maxWidth: UIScreen.main.bounds.width, alignment: .center)
					.overlay(
						HStack{
							Text("Rendang Goreng Balado pedas manis ala chef televisi terkenal di indonesia bagian tenggara")
								.font(.title3)
								.foregroundColor(Color(UIColor.white))
								.lineLimit(2)
								.minimumScaleFactor(0.5)
								.padding()
						}
							.frame(minWidth: UIScreen.main.bounds.width - 40, alignment: .center)
							.background(Color(UIColor.black).opacity(0.5))
						,alignment: .bottom
					)
				
				VStack(alignment: .leading, spacing: 8){
					Text("Ingredients")
						.font(.headline)
					ForEach(0..<5, id:\.self){ ing in
						HStack(alignment: .center, spacing: 8){
							Button(action: { showModal = true }) {
								Image("mealSmall")
									.resizable()
									.frame(width: 40, height: 40, alignment: .center)
									.cornerRadius(8)
									.padding(4)
							}
							.fullScreenCover(isPresented: $showModal) {
								LocalImageViewer()
							}
							
							Text("Salt 3 tea spoons")
								.font(.headline)
								.foregroundColor(Color(UIColor.white))
							Spacer()
						}
						.background(Color(UIColor.systemTeal))
						.cornerRadius(8)
						
					}
				}
				.padding()
				
				VStack(alignment: .leading, spacing: 8){
					Text("Instructions")
						.font(.headline)
					ForEach(1..<6, id:\.self){ ing in
						HStack(alignment: .top, spacing: 8){
							
							Image(systemName:"\(ing).circle")
								.resizable()
								.frame(width: 20, height: 20, alignment: .center)
								.padding(4)
							Text("Combine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.")
								.font(.subheadline)
								.foregroundColor(Color(UIColor.label))
							Spacer()
						}
					}
				}
				.padding()
				
				VStack(alignment: .leading, spacing: 8){
					HStack(alignment: .top, spacing: 0){
						Text("Tags : ")
							.font(.footnote)
						ForEach(1..<5,  id:\.self){ x in
							NavigationLink(destination: Text("Tag Destination"), label: {
								Text(" #tag\(x)")
									.font(.footnote)
							})
							
						}
						Spacer()
					}
					
					HStack(alignment: .center, spacing: 0){
						Text("Source : ")
							.font(.footnote)
						Text("[Youtube](https://www.youtube.com/watch?v=4aZr5hZXP_s)")
							.font(.footnote)
						Spacer()
					}
				}
				.padding()
			}
			
		}
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: Button(action : {
			self.mode.wrappedValue.dismiss()
		}){
			Image(systemName: "arrow.left")
		})
		.toolbar{
			ToolbarItem(placement: .principal, content: {
				Text("Detail")
			})
		}
	}
}

struct MealScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailScreen()
    }
}
