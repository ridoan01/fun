//
//  Home.swift
//  GoodMovie
//
//  Created by Ridoan Wibisono on 03/10/21.
//

import SwiftUI

struct Home: View {
	var body: some View {
		NavigationView(){
			ScrollView(.vertical){
				VStack(alignment: .leading, spacing: 20){
					BackdropThumbnail()
						//						.frame(minWidth: UIScreen.main.bounds.width,
						//							   maxWidth: .infinity,
						//							   minHeight: 100,
						//							   maxHeight: .infinity,
						//							   alignment: .center)
						.overlay(
							TitleOverlay()
							, alignment: .bottom
						)
					PosterCell(title: "NEW RELEASES")
					
					TrailerCell(title: "TRAILER")
					
					PosterCell(title: "POPULAR MOVIES")
					
					DetailCell()
					
					PosterCell(title: "FOR YOU")
					
					BackdropImageCell(title: "POPULAR TV SHOW")
					
				}
			}
			.navigationBarTitleDisplayMode(.inline)
			.toolbar(content: {
				ToolbarItem(placement: .principal) {
					HStack{
						Image("logo")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 200, height: 30, alignment: .center)
					}
				}
			})
			.navigationBarItems(
				leading:
					Image("poster")
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 26, height: 26, alignment: .center)
					.cornerRadius(13)
					.overlay(
						Circle()
							.stroke(lineWidth: 1)
							.foregroundColor(.primary)
						, alignment: .center
					)
				,
				trailing:
					NavigationLink(
						destination: Text("Search"),
						label: {
							Image(systemName:"magnifyingglass")
								.resizable()
								.aspectRatio(contentMode: .fill)
								.frame(width: 20, height: 20, alignment: .center)
								.accentColor(.primary)
						})
				
			)
		}
	}
}

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		Home().preferredColorScheme(.light)
	}
}

struct BackdropThumbnail : View {
	var body: some View {
		ZStack {
			Image("backdrop")
				.resizable()
				.aspectRatio(contentMode: .fit)
			
		}
	}
}

struct PosterCell : View {
	var title : String
	var body: some View  {
		VStack(alignment: .leading, spacing: 4) {
			Text(title)
				.font(.headline)
				.padding(.leading, 20)
			Divider()
			ScrollView(.horizontal, showsIndicators : false){
				HStack(spacing: 4){
					Spacer()
					ForEach (0..<5) { x in
						PosterImageCell(img: "poster")
							.frame(minWidth: 0.100, maxWidth: .infinity, maxHeight: 200, alignment: .center)
							.overlay(
								LoveToggle()
									.padding(.top, 4)
								,
								alignment: .topTrailing
							)
						Spacer()
					}
				}
			}
			.padding(.top, 4)
		}
	}
}

struct BackdropImageCell : View {
	var title : String
	var body: some View  {
		VStack(alignment: .leading, spacing: 4) {
			Text(title)
				.font(.headline)
				.padding(.leading, 20)
			Divider()
			ScrollView(.horizontal, showsIndicators : false){
				HStack(spacing: 4){
					Spacer()
					ForEach (0..<5) { x in
						PosterImageCell(img: "backdrop")
							.frame(minWidth: 0.100, maxWidth: .infinity, maxHeight: 200, alignment: .center)
							.overlay(
								LoveToggle()
									.padding(.top, 4)
								,
								alignment: .topTrailing
							)
						Spacer()
					}
				}
			}
			.padding(.top, 4)
		}
	}
}

struct PosterImageCell : View {
	var img : String
	var body: some View {
		ZStack(alignment: .center){
			Image(img)
				.resizable()
				.cornerRadius(8)
				.aspectRatio(contentMode: .fit)
		}
	}
}

struct DetailCell : View {
	var body: some View {
		HStack(alignment: .top, spacing: 10){
			PosterImageCell(img: "poster")
				.frame(width: 80)
			VStack(alignment: .leading, spacing: 4){
				
				NavigationLink(
					destination: Text("Destination"),
					label: {
						Text("Cruella the magistic woman ever live on earth")
							.font(.headline)
							.lineLimit(2)
							.foregroundColor(.white)
							.padding(.bottom, 4)
					})
				Text("Overview")
					.font(.subheadline)
					.lineLimit(1)
					.foregroundColor(.white)
				Text("In 1970s London amidst the punk rock revolution, a young grifter named Estella is determined to make a name for herself with her designs. She befriends a pair of young thieves who appreciate her appetite for mischief, and together they are able to build a life for themselves on the London streets. One day, Estella’s flair for fashion catches the eye of the Baroness von Hellman, a fashion legend who is devastatingly chic and terrifyingly haute. But their relationship sets in motion a course of events and revelations that will cause Estella to embrace her wicked side and become the raucous, fashionable and revenge-bent Cruella.")
					.font(.footnote.italic())
					.lineLimit(3)
					.foregroundColor(.white)
					.truncationMode(.tail)
			}
			Spacer()
		}
		.padding()
		.background(Color(.systemRed))
	}
}

struct TitleOverlay : View {
	var body: some View {
		HStack{
			Spacer()
			VStack(alignment: .center, spacing: 8){
				Text("Cruella the magistic woman ever live on earth")
					.font(.title3)
					.foregroundColor(.white)
					.lineLimit(1)
					.frame(width: 200, alignment: .center)
				Text("In 1970s London amidst the punk rock revolution, a young grifter named Estella is determined to make a name for herself with her designs. She befriends a pair of young thieves who appreciate her appetite for mischief, and together they are able to build a life for themselves on the London streets. One day, Estella’s flair for fashion catches the eye of the Baroness von Hellman, a fashion legend who is devastatingly chic and terrifyingly haute. But their relationship sets in motion a course of events and revelations that will cause Estella to embrace her wicked side and become the raucous, fashionable and revenge-bent Cruella.")
					.font(.footnote.italic())
					.lineLimit(2)
					.foregroundColor(.white)
					.truncationMode(.tail)
					.padding(.bottom, 8)
			}
			Spacer()
		}
		.background(Color(.black).opacity(0.8))
	}
}

struct LoveToggle : View {
	@State private var isOn = false
	
	var body: some View {
		Toggle("", isOn: $isOn)
			.toggleStyle(LoveToggleStyle())
		
	}
}

struct LoveToggleStyle : ToggleStyle{
	func makeBody(configuration: Configuration) -> some View {
		Button{
			configuration.isOn.toggle()
		}
		label: {
			Label{
				configuration.label
			}
			icon: {
				Image(systemName: configuration.isOn ? "heart.fill" : "heart")
					.foregroundColor(configuration.isOn ? Color(.red) : Color(.systemRed))
					.accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
					.imageScale(.large)
			}
		}
	}
	
	
}

struct TrailerCell: View{
	var title : String
	
	var body: some View{
		VStack(alignment: .leading, spacing: 8){
			Text(title)
				.font(.headline)
				.padding(.leading, 20)
			Divider()
			ScrollView(.horizontal, showsIndicators: false){
				HStack(spacing: 10){
					Spacer()
					ForEach(0..<5){_ in
						VStack(alignment: .center, spacing: 8){
							TrailerThumbnail()
								.frame(minWidth: 0.100, maxWidth: 210,
									   alignment: .center)
						}
					}
				}
			}
		}
	}
}

struct TrailerThumbnail : View {
	var body: some View {
		LazyVStack(alignment: .center, spacing: 4){
			Image("trailer")
				.resizable()
				.cornerRadius(8)
				.aspectRatio(contentMode: .fit)
				.overlay(
					Image(systemName: "play.fill")
						.renderingMode(.template)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.foregroundColor(.white)
						.frame(width: 40, height: 40, alignment: .center)
					, alignment: .center)
				.padding(.bottom, 4)
			Text("Cruella the magistic woman ever live on earth")
				.font(.title3.bold())
				.foregroundColor(Color(.label))
				.lineLimit(1)
			Text("Official Trailer")
				.font(.subheadline)
				.foregroundColor(Color(.label))
				.lineLimit(1)
		}
	}
}
