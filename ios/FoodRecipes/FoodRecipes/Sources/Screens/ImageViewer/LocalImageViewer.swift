//
//  LocalImageViewer.swift
//  FoodRecipes
//
//  Created by Ridoan Wibisono on 18/10/21.
//

import SwiftUI

struct LocalImageViewer: View {
	@Environment(\.presentationMode) var presentationMode
	
	@State private var scale: CGFloat = 1.0
	@State private var lastScale: CGFloat = 1.0
	@State private var viewState = CGSize.zero
	
	@State private var zoomLevel : CGFloat = 1.0
	
	var body: some View {
		NavigationView{
		VStack{
	
			Image("mealLarge")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.animation(.spring())
				.offset(x: viewState.width, y: viewState.height)
				.gesture(DragGesture()
							.onChanged { val in
					self.viewState = val.translation
				})
				.scaleEffect(scale)
				.gesture(MagnificationGesture().onChanged { val in
					let delta = val / self.lastScale
					self.lastScale = val
					if delta > 0.94 { // if statement to minimize jitter
						let newScale = self.scale * delta
						self.scale = newScale
					}
				}
							.onEnded { _ in
					self.lastScale = 1.0
				})
				.onTapGesture(count: 2) {
					self.scale = 1.0
				}
			
				.toolbar{
					ToolbarItem(placement: .navigationBarLeading, content: {
						Image(systemName: "xmark.circle.fill")
							.onTapGesture {
								presentationMode.wrappedValue.dismiss()
							}
					})
				}
		}
		
		}
	}
}


struct LocalImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        LocalImageViewer()
    }
}
