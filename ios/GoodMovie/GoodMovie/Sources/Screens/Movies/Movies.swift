//
//  MovieList.swift
//  GoodMovie
//
//  Created by Ridoan Wibisono on 04/10/21.
//

import SwiftUI


var genres = ["Action", "Adventure"," Fiction"," Family","Comedy"]

struct Movies: View {
	var body: some View {
		NavigationView(){
			ScrollView(.vertical){
				VStack(alignment: .leading, spacing: 10){
					ForEach(0..<12){ x in
						MovieListCell()
					}
				}
				.padding()
			}
			.navigationTitle(NSLocalizedString("Movies", comment: "Movie List"))
			.navigationBarTitleDisplayMode(.inline)
		}
	}
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
		Movies().preferredColorScheme(.dark)
		CapsuleText(str: "genre")
    }
}

struct MovieListCell: View {
	var body: some View{
		HStack(alignment:.top, spacing: 8){
			PosterImageCell(img: "poster")
				.frame(maxWidth: 80)
			VStack(alignment: .leading, spacing: 8){
				Text("Cruella The Ironic of woman ever live on planet earth")
					.font(.subheadline)
					.fontWeight(.medium)
					.lineLimit(2)
				
				ScrollView(.horizontal, showsIndicators: false){
					HStack{
						ForEach (genres, id: \.self) { genre in
							CapsuleText(str: genre)
						}
					}
					.padding(.trailing, 8)
				}
//
//				Text("Action | Adventure | Fiction | Family | Comedy")
//					.font(.footnote)
//					.fontWeight(.light)
//					.lineLimit(1)
//					.padding(.bottom, 8)
				
				Text("Rating : ")
					.font(.footnote)
					.fontWeight(.regular)
					.multilineTextAlignment(.center)
					.lineLimit(1)
			}
		}
		.padding(4)
		.background(
			LinearGradient(gradient: Gradient(colors: [Color(.secondarySystemBackground).opacity(1), Color(.systemBackground).opacity(0.2)]),
						   startPoint: .trailing,
						   endPoint: .leading)
		)
		.cornerRadius(8)
	}
	
}


struct RingCircle: View {
	var body: some View{
		ZStack{
			Circle()
				.foregroundColor(.black)
				.frame(width: 65, height: 65)
			Circle()
				.stroke(Color(.gray).opacity(0.6), style: StrokeStyle(lineWidth: 5))
				.frame(width: 60, height: 60)
			Circle()
				.trim(from: 0.18, to: 1)
				.stroke(
					LinearGradient(gradient: Gradient(colors: [Color(.systemTeal), Color(.systemBlue)]), startPoint: .topTrailing, endPoint: .leading),
					style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
				)
				.frame(width: 60, height: 60)
				.rotationEffect(Angle(degrees: 90))
				.rotation3DEffect(
					Angle(degrees: 180),
					axis: (x: 1, y: 0, z: 0)
				)
				.shadow(color: .green.opacity(0.5), radius: 3, x: 0	, y: 0)
			HStack(alignment: .center, spacing: 0){
				Text("82")
					.font(.body.bold())
					.foregroundColor(Color.white)
				Text("%")
					.font(.system(size: 10).bold())
					.foregroundColor(Color.white)
			}
		}
	}
}


struct CapsuleText : View {
	var str : String
	var body: some View{
		Text(str)
			.font(.footnote)
			.foregroundColor(Color(.label))
			.padding(.horizontal, 8)
			.padding(.vertical, 4)
			.background(
				Capsule()
					.stroke(getStrokeGradient(), lineWidth: 1),
				alignment: .center
					
			)
	}
}

func getStrokeGradient() -> LinearGradient {
	return LinearGradient(gradient: Gradient(colors: [Color(.blue).opacity(1), Color(.systemTeal).opacity(1)]),
						  startPoint: .topTrailing,
						  endPoint: .bottomLeading)
}


