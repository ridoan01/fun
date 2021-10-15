//
//  Home.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 07/07/21.
//

import SwiftUI

struct Home: View {
	@StateObject var homeData = HomeViewModel()
	var width = UIScreen.main.bounds.width - (40 + 60)
	var height = UIScreen.main.bounds.height / 2
	
	@State var swiped = 0
	
	var body: some View {
		NavigationView{
			ZStack {
				Color(.secondarySystemBackground).ignoresSafeArea()
				VStack(spacing: 0) {
					HStack(spacing: 8){
						HStack {
							
							Image(systemName: "gyroscope")
								.font(.title)
							
						}.padding(.horizontal)
						Spacer()
						HStack{
							
							Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
								Text("MOVIES")
							})
							Spacer()
							Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
								Text("TV SHOW")
							})
							
						}.padding(.horizontal)
						Spacer()
						HStack{
							Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
								Image(systemName: "magnifyingglass")
									.font(.title)
							})
						}.padding(.horizontal)
						
					}
					.frame(width: UIScreen.main.bounds.width, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
					.background(Color(.secondarySystemBackground))
					
					ScrollView(.vertical, showsIndicators: false){
						
						VStack {
							ScrollView(.horizontal, showsIndicators: false){
								Card3()
								
							}.padding(.top, 8)
							
							VStack{
								HStack {
									Text("POPULAR MOVIES")
										.font(.body)
										.bold()
										.multilineTextAlignment(.leading)
									Spacer()
								}.padding(.horizontal)
								
								Card2()
							}.padding(.top,8)
							
							VStack{
								HStack {
									Text("TOP RATED MOVIES")
										.font(.body)
										.bold()
										.multilineTextAlignment(.leading)
									Spacer()
								}.padding(.horizontal)
								
								Card2()
							}.padding(.top,2)
							
							VStack{
								HStack {
									Text("NOW PLAYING")
										.font(.body)
										.bold()
										.multilineTextAlignment(.leading)
									Spacer()
								}.padding(.horizontal)
								
								ScrollView(.horizontal, showsIndicators: false){
									Card1()
									
								}.padding(.top, 2)
							}.padding(.top,2)
							
							VStack{
								HStack {
									Text("DRAMA MOVIES")
										.font(.body)
										.bold()
										.multilineTextAlignment(.leading)
									Spacer()
								}.padding(.horizontal)
								
								Card2()
							}.padding(.top,2)
							.padding(.bottom, 100)
							
							
						}
						
						
						
					}
					
				}.background(Color(.tertiarySystemBackground))
				.ignoresSafeArea(edges: .bottom)
				
				
			}
			.navigationBarHidden(true)
		}
	}
	
	func getHeight(index : Int) -> CGFloat {
		return height - (index - swiped < 3 ? CGFloat(index-swiped) * 40:80)
	}
}

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		Home().preferredColorScheme(.light)
		
	}
}


extension View{
	func getRec() -> CGRect {
		return UIScreen.main.bounds
	}
}


struct FeatureImages: View {
	@State var showDetail = false
	@State var index = 0
	var body: some View {
		
		HStack{
			TabView(selection: $index){
				
				ForEach(1...5,id: \.self){ idx in
					AsyncImage(url: URL(string: basePath+movies[idx].poster)!, placeholder: {Color.black}, image: { image in
						Image(uiImage: image)
							.resizable()
						
					})
					.frame(height: self.index == index ? 480:180)
					.tag(idx)
					.onTapGesture {
						let movieId = movies[idx].id
						print(movies[movieId].name)
						
					}
				}
				
			}
			.frame(width: getRec().width, height: 480, alignment: .center)
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
			.animation(.linear)
		}
		
	}
}



struct DetailModal : View {
	
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>
	@State var movieId: Int
	
	var body: some View{
		VStack{
			//            AsyncImage(url: URL(string: basePath+movieData[movieId].poster)!, placeholder: {Color.black}, image: { image in
			//                Image(uiImage: image)
			//                    .resizable()
			//
			//            })
			Text("ID = \(movieId)")
			Text("Title : \(movies[movieId-1].name)")
			
		}
		.navigationBarBackButtonHidden(true)
		.navigationBarItems(leading: Button(action : {
			self.mode.wrappedValue.dismiss()
		}){
			Image(systemName: "arrow.left")
		})
	}
	
}

class HomeViewModel: ObservableObject{
	@Published var offset: CFloat = 0
	
	
}





struct Card1: View {
	private  var width = UIScreen.main.bounds.width - 20
	private var height = UIScreen.main.bounds.width / 1.5
	var body: some View {
		HStack(spacing: 2){
			ForEach(0..<8){ mv in
				NavigationLink(
					destination: MovieDetail(mID: mv),
					label: {
						AsyncImage(url: URL(string: basePath+movies[mv].backdrop)!,
								   placeholder: {Color.black},
								   image: { image in
									Image(uiImage: image)
										.resizable()
									
								   })
							.frame(width: width, height: height, alignment: .center)
							.aspectRatio(contentMode: .fit)
							.cornerRadius(12)
							.shadow(color: Color(.black).opacity(0.4), radius: 3, x: 3, y: 3)
							.padding(.horizontal, 10)
							.padding(.vertical, 6)
					})
				
			}
		}
	}
}


struct Category : Identifiable{
	var id: Int
	var name: String
	var bgColor : Color
}

var categories = [
	Category(id: 0, name: "Action", bgColor: Color(.red)),
	Category(id: 0, name: "Comedy", bgColor: Color(.green)),
	Category(id: 0, name: "Drama", bgColor: Color(.blue)),
	Category(id: 0, name: "Fiction", bgColor: Color(.yellow)),
	Category(id: 0, name: "Horor", bgColor: Color(.orange)),
	Category(id: 0, name: "Sci-Fi", bgColor: Color(.purple)),
	Category(id: 0, name: "Documentary", bgColor: Color(.magenta)),
	Category(id: 0, name: "Animation", bgColor: Color(.systemGreen))
	
]

struct Card2: View {
	private var width = UIScreen.main.bounds.width - (40 + 60)
	private var height = UIScreen.main.bounds.height / 2
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false){
			HStack (spacing: 8){
				ForEach(0..<movies.count){ mv in
					NavigationLink(
						destination: MovieDetail(mID: mv),
						label: {
							VStack{
								AsyncImage(url: URL(string: basePath+movies[mv].poster)!,
										   placeholder: {Color.black},
										   image: { image in
											Image(uiImage: image)
												.resizable()
											
										   })
									.frame(width: width/2.5, height: height/2.5, alignment: .center)
									.aspectRatio(contentMode: .fit)
									.cornerRadius(10)
									.shadow(color: Color(.black).opacity(0.4), radius: 3, x: 3, y: 3)
									.padding(.bottom, 8)
								
								
							}
							
						})
					
				}
			}.padding(.horizontal)
		}
	}
}

struct Card3: View {
	private var width = UIScreen.main.bounds.width - (40 + 60)
	private var height = UIScreen.main.bounds.height / 2
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false){
			HStack (spacing: 8){
				ForEach(0..<movies.count){ mv in
					NavigationLink(
						destination: MovieDetail(mID: mv),
						label: {
							VStack{
								AsyncImage(url: URL(string: basePath+movies[mv].poster)!,
										   placeholder: {Color.black},
										   image: { image in
											Image(uiImage: image)
												.resizable()
											
										   })
									.frame(width: width, height: height, alignment: .center)
									.aspectRatio(contentMode: .fit)
									.cornerRadius(10)
									.shadow(color: Color(.black).opacity(0.4), radius: 3, x: 3, y: 3)
									.padding(8)
								
								
							}
							
						})
					
				}
			}.padding(.horizontal)
		}
	}
}
