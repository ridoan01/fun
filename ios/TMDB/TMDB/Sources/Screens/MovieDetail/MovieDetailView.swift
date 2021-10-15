//
//  MovieDetailView.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 02/10/21.
//

import SwiftUI

struct MovieDetailView: View {
	@ObservedObject var model : MovieDetailViewModel
	
	var body: some View {
		VStack{
			ScrollView {
				VStack{
					AsyncImage(url: URL(string:"\(ApiConstants.originalImageUrl)"+"\(model.movieDetail.backdrop_path)")!,
							   placeholder: {ProgressView()},
							   image: { image in
								Image(uiImage: image)
									.resizable()
							   })
						.frame(width: UIScreen.main.bounds.width,
							   height: UIScreen.main.bounds.height / 2,
							   alignment: .center)
						.aspectRatio(contentMode: .fit)
						.overlay(
							titleOverlay()
							, alignment: .bottom)
					
						
				}
				
			}
		}
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
		.edgesIgnoringSafeArea(.top)
	}
	
}

struct MovieDetailView_Previews: PreviewProvider {
	static var previews: some View {
		MovieDetailView(model: MovieDetailViewModel(movieId: 550988))
	}
}


extension MovieDetailView{
		private func titleOverlay() -> some View {
		return VStack(alignment: .center, spacing : 2){
			Spacer()
			Text(model.movieDetail.title)
				.font(.title)
				.lineLimit(2)
				.foregroundColor(.white)
			Spacer()
			ScrollView(.horizontal){
			HStack(alignment: .firstTextBaseline, spacing: 8){
				ForEach (0..<8) { x in
					Spacer()
					Text("Duation \(x)").foregroundColor(.white)
						.minimumScaleFactor(0.6)
						.padding(.horizontal, 8)
						.padding(.vertical, 4)
						.overlay(
							Capsule()
								.stroke(Color(.red), lineWidth: 1)
						)
						
				}
				Spacer()
			}
				
			}
			Spacer()
		}
		.frame(minWidth: 0 , maxWidth: .infinity, minHeight: 80, idealHeight: 100, maxHeight: 120)
		.background(Color(.black).opacity(0.8))
	}
}
