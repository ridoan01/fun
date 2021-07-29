//
//  MovieDetailView.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 12/07/21.
//

import SwiftUI


struct MovieDetailView: View {
    let item: MovieModel
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color(.gray).edgesIgnoringSafeArea(.bottom)
            VStack{
                
                Image(systemName: "xmark")
                    .font(.title)
                    .onTapGesture {
                        isPresented = false
                        
                    }
                
               
                VStack(alignment: .center){
                    Text(item.name)
                }
               
            }
           
            
        }
        Spacer()
    

    }
}
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
//        MovieDetailView(item: MovieModel.init(id: 0, name: "Gondes", poster: ""), isPresented: .constant(false))
        Home()
        
    }
}
