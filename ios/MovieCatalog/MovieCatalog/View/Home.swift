//
//  Home.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 07/07/21.
//

import SwiftUI
import SwURL

struct Home: View {
    @State var index = 0
    @State var show = false
    @State var selectedMovie : MovieModel!
    
    init() {
        SwURL.setImageCache(type: .persistent)
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            //            Color(.black).edgesIgnoringSafeArea(.top)
            VStack{
                ZStack{
                    HStack{
                        
                        Button(action: {print("Jamie")}, label: {
                            Text("Hi, Jamie!")
                                .fontWeight(.regular)
                                .multilineTextAlignment(.center)
                                .font(.title2)
                                .padding(.horizontal)
                            
                            
                        })
                        Spacer()
                        Button(action: {}){
                            
                            AsyncImage(url: URL(string:"https://images.statusfacebook.com/profile_pictures/girl-with-hat-profile-pics/girl-with-hat-profile-pictures-dp-for-whatsapp-facebook-033.jpg")!,
                                       placeholder: {
                                        Image(systemName: "person.crop.circle")
                                            .foregroundColor(.gray)
                                            .font(.title)
                                        
                                       },
                                       image: { image in
                                        Image(uiImage: image)
                                            .resizable()
                                       }
                            )
                            .frame(width: 42, height: 42, alignment: .center)
                            .clipShape(Circle())
                            .padding(.horizontal)
                            
                        }
                    }
                    
                }
                
                ZStack{
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(alignment: .leading, spacing: nil){
                            
                            HStack{
                                
                                TabView(selection: $index){
                                    
                                    ForEach(0...4,id: \.self){ idx in
                                        AsyncImage(url: URL(string: basePath+movieData[idx].poster)!, placeholder: {Color.black}, image: { image in
                                            Image(uiImage: image)
                                                .resizable()
                                            
                                        })
                                        .frame(height: self.index == index ? 480:180)
                                        .tag(idx)
                                        .onTapGesture {
                                            let movieId = movieData[idx].id
                                            print(movieData[movieId].name)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .frame(width: getRec().width, height: 480, alignment: .center)
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                                .animation(.linear)
                            }
                            
                            HStack{
                                Text("Movie List")
                                    .font(.title2)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                Spacer()
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("More")
                                        .padding(.horizontal)
                                })
                            }
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(alignment:.center, spacing: 10){
                                    ForEach(movieData){ idx in
                                        
                                        AsyncImage(url: URL(string: basePath+idx.poster)!, placeholder: {Color.black}, image: { image in
                                            Image(uiImage: image)
                                                .resizable()
                                            
                                        })
                                        .frame(width: 90,height:120, alignment: .center)
                                        .cornerRadius(10)
                                        .aspectRatio(contentMode: .fit)
                                        .overlay(RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.white, lineWidth: 1))
                                        .shadow(radius: 1)
                                        .padding(.vertical)
                                        
                                    }
                                }
                                
                            }
                        }
                    }
                    
                }
            }
        }.navigationBarHidden(true)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        
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
                
                ForEach(0...4,id: \.self){ idx in
                    AsyncImage(url: URL(string: basePath+movieData[idx].poster)!, placeholder: {Color.black}, image: { image in
                        Image(uiImage: image)
                            .resizable()
                        
                    })
                    .frame(height: self.index == index ? 480:180)
                    .tag(idx)
                    .onTapGesture {
                        let movieId = movieData[idx].id
                        print(movieData[movieId].name)
                        
                    }
                    
                }
                
            }
            .frame(width: getRec().width, height: 480, alignment: .center)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .animation(.linear)
        }
        
    }
}


struct Detail: View {
    let item: MovieModel
    
    var body: some View {
        Text(item.name)
    }
}
