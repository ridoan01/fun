//
//  MovieListView.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 01/10/21.
//

import SwiftUI

struct MovieListView: View {
	@ObservedObject var model: MovieListViewModel
	
	var body: some View {
		VStack{
			NavigationView(){
				ScrollView{
					LazyVStack(spacing: 10){
						ForEach(model.movies, id:\.self){ item in
							NavigationLink(
								destination: MovieListRouter.destinationForTappedMovie(movieId: item.id)){
								movieCell(movie: item)
							}
							.buttonStyle(PlainButtonStyle())
							.onAppear(perform: { model.loadMoreIfNeeded(currentMovie: item) })
						}
						.padding(.horizontal, 10)
						if model.isLoading{ ProgressView() }
					}
					.padding(.top, 10)
				}
				.navigationBarTitle("\(NSLocalizedString("Movie List", comment: "Movies"))", displayMode: .inline)
			}
			
		}
	}
}

struct MovieListView_Previews: PreviewProvider {
	static var previews: some View {
		MovieListView(model: MovieListViewModel())
	}
}

extension MovieListView{

	private func movieCell(movie: Movie) -> some View {
	return HStack(alignment: .top, spacing: 2){
		AsyncImage(url: URL(string: "\(ApiConstants.smallImageUrl)"+"\(movie.poster_path)")!,
				   placeholder: {ProgressView()},
				   image: { image in
					Image(uiImage: image)
						.resizable()
				   })
			.frame(width: 80,
				   height: 120,
				   alignment: .center)
			.aspectRatio(contentMode: .fit)
			.cornerRadius(10)
			.shadow(color: Color(.black).opacity(0.4), radius: 3, x: 3, y: 3)
			.padding(.vertical, 8)
			.padding(.trailing, 8)
		
		VStack(alignment: .leading, spacing: 4){
			Text("\(movie.title)")
				.font(.system(.headline))
				.lineLimit(2)
//				.minimumScaleFactor(0.4)
				.padding(.bottom, 8)
			HStack(spacing: 10){
				Image(systemName: "crown")
					.renderingMode(.original)
					.frame(width: 10, height: 10, alignment: .center)
					.aspectRatio(contentMode: .fit)
				Text("\(model.dateFormater(str: movie.release_date))")
					.lineLimit(1)
					.minimumScaleFactor(0.05)
			}
			.padding(.leading, 8)
			HStack(spacing: 10){
				Image(systemName: "crown")
					.renderingMode(.original)
					.frame(width: 10, height: 10, alignment: .center)
					.aspectRatio(contentMode: .fit)
				Text("Genre")
					.lineLimit(1)
					.minimumScaleFactor(0.05)
			}
			.padding(.leading, 8)
		}
		.padding(.top, 10)
		.padding(.leading, 2)
		Spacer()
		HStack(alignment: .center, spacing: 8){
			Image(systemName: "star.fill")
				.renderingMode(.original)
				.frame(width: 10, height: 10, alignment: .center)
			Text("\(model.formatRating(float: movie.vote_average)) ( \(movie.vote_count) )")
				.font(.callout)
				.lineLimit(1)
				.minimumScaleFactor(0.05)
		}
		.rotationEffect(Angle(degrees: -90), anchor: .bottomTrailing)
		.padding(.trailing, 10)
	}
	.padding(.horizontal, 10)
	.background(Color(.systemGray))
	.cornerRadius(8)
}

}

struct SmallCard : View {
	var body: some View {
		HStack(alignment: .top, spacing: 2){
			AsyncImage(url: URL(string: "\(ApiConstants.originalImageUrl)/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg")!,
					   placeholder: {Color.black},
					   image: { image in
						Image(uiImage: image)
							.resizable()
					   })
				.frame(width: 80,
					   height: 120,
					   alignment: .center)
				.aspectRatio(contentMode: .fit)
				.cornerRadius(10)
				.shadow(color: Color(.black).opacity(0.4), radius: 3, x: 3, y: 3)
				.padding(.vertical, 8)
				.padding(.trailing, 8)
			
			VStack(alignment: .leading, spacing: 4){
				Text("Movie title more title longer again")
					.font(.system(.title).bold())
					.lineLimit(2)
					.minimumScaleFactor(0.05)
					.padding(.bottom, 8)
				HStack(spacing: 10){
					Image(systemName: "crown")
						.renderingMode(.original)
						.frame(width: 10, height: 10, alignment: .center)
						.aspectRatio(contentMode: .fit)
					Text("Duration")
						.lineLimit(1)
						.minimumScaleFactor(0.05)
				}
				.padding(.leading, 8)
				HStack(spacing: 10){
					Image(systemName: "crown")
						.renderingMode(.original)
						.frame(width: 10, height: 10, alignment: .center)
						.aspectRatio(contentMode: .fit)
					Text("Genre")
						.lineLimit(1)
						.minimumScaleFactor(0.05)
				}
				.padding(.leading, 8)
			}
			.padding(.top, 10)
			.padding(.leading, 2)
			HStack(spacing: 10){
				Image(systemName: "star.fill")
					.renderingMode(.original)
					.frame(width: 10, height: 10, alignment: .center)
				Text("8.5 (250)")
					.font(.callout)
					.lineLimit(1)
					.minimumScaleFactor(0.05)
			}
			.rotationEffect(Angle(degrees: -90), anchor: .bottomTrailing)
			.padding(.trailing, 10)
		}
		.padding(.horizontal, 10)
		.background(Color(.systemGroupedBackground))
		.cornerRadius(8)
		
	}
}
