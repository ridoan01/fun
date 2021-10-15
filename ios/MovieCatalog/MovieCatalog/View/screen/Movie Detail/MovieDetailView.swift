//
//  MovieDetailView.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 12/07/21.
//

import SwiftUI

struct MovieDetail : View{
	@State var mID :  Int
	
	var body: some View{
		VStack{
			AsyncImage(url: URL(string: basePath+movies[mID].poster)!,
					   placeholder: {Color.black},
					   image: { image in
						Image(uiImage: image)
							.resizable()
						
					   })
				.cornerRadius(12)
			Text("ID : \(movies[mID].id)")
			Text("Title : \(movies[mID].name)")
		}
		.offset(x: 0, y: -60)
		
	}
	
}
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        MovieDetailView(item: MovieModel.init(id: 0, name: "Gondes", poster: ""), isPresented: .constant(false))
		MovieDetail(mID: 0)
        
    }
}
