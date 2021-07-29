//
//  PeopleView.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 15/07/21.
//

import SwiftUI

struct PeopleView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var selected = tabs[0]
    @State var currentTab =  "Biography"
    var body: some View {
        ZStack(alignment: .leading){
            Color(UIColor.systemFill)
            
            VStack{
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                    
                    ZStack{
                        
                        AsyncImage(url: URL(string: basePath+"/rTh4K5uw9HypmpGslcKd4QfHl93.jpg")!, placeholder: {Color.black}, image: { image in
                            Image(uiImage: image)
                                .resizable()
                                
                        })
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle(), style: FillStyle())
                        .frame(maxWidth: .infinity)
                    
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 218 / 255,green: 34 / 255,blue: 255 / 255),Color(red: 151 / 255,green: 51 / 255,blue: 238 / 255)]),startPoint: .top, endPoint: .bottom))
                    
                    
                    
                    ZStack{
                        Text("John claude van damm")
                            .font(.title2)
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 80)
                            .foregroundColor(.white)
                            .padding(0)
                    }
                    .padding(.vertical, -80)
                    
                    VStack{
                        HStack{
                            AsyncImage(url: URL(string: basePath+"/rTh4K5uw9HypmpGslcKd4QfHl93.jpg")!, placeholder: {Color.black}, image: { image in
                                Image(uiImage: image)
                                    .resizable()
                                
                                
                            })
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(40)
                            .padding()
                            
                            VStack(alignment: .leading){
                                Text("John Claude Van Damm")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(Color(UIColor.label))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("Actor")
                                    .font(.body)
                                    .foregroundColor(Color(UIColor.label))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("Female")
                                    .font(.body)
                                    .foregroundColor(Color(UIColor.label))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }.background(Color(UIColor.systemGroupedBackground))
                        
                        ZStack(alignment: .leading){
                            Color(UIColor.systemGroupedBackground)
                            HStack{
                                ForEach(tabs, id:\.self){ tab in
                                    
                                    
                                    //                                Button(action: {
                                    //                                    currentTab = tab
                                    //                                }, label: {
                                    //                                    Text(tab)
                                    //                                        .fontWeight(currentTab == tab ? .bold : .regular)
                                    //                                        .foregroundColor(
                                    //                                            currentTab == tab ? Color(UIColor.label): Color(UIColor.secondaryLabel))
                                    //
                                    //                                        .padding(.horizontal)
                                    //                                })
                                    
                                    TabButton(title: tab, selected: $selected)
                                        .padding(.horizontal)
                                    if tabs.last != tab{Spacer(minLength: 0)}
                                }
                                
                                
                            }
                        }
                        
                        
                    }
                })
                
                
            }
            
        }.ignoresSafeArea()
    }
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView().preferredColorScheme(.light)
    }
}


var tabs = ["Biography","Movies","Gallery"]



struct TabButton:View {
    var title : String
    @Binding var selected : String
    
    var body: some View{
        Button(action: {
            selected = title
        }, label: {
            Text(title)
                .padding(.vertical, 10)
                .padding(.horizontal, selected == title ? 20 : 0)
                .foregroundColor(selected == title ? .white: .black)
                .background(
                    ZStack{
                        if selected == title{
                            Color.black
                                .clipShape(Capsule())
                        }
                    }
                )
        })
    }
    
    
    
}
