//
//  MovieDetailView.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 12/07/21.
//

import SwiftUI

struct MovieDetailView: View {
    @State var index = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(alignment: .leading, spacing: 6){
                
                HStack{
                
                    TabView(selection: self.$index){
                        ForEach(0...4,id: \.self){ idx in
                            
                            VStack{
                        
                                AsyncImage(url: URL(string: basePath+movieData[idx].poster)!, placeholder: {Color.black}, image: { image in
                                    Image(uiImage: image)
                                        .resizable()
                                    
                                })
                                .frame(height: self.index == index ? 480:180)
                                .tag(index)
                                
                            }
                        }
                    }
                    .frame(width: getRec().width, height: 480, alignment: .center)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .animation(.linear)
                                
                }
                
            }
        }).ignoresSafeArea(edges: .top)
    }
}


struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
    
}
