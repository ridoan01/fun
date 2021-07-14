//
//  MovieModel.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 12/07/21.
//

import Foundation

struct MovieModel : Identifiable {
    var id : Int
    var name : String
    var poster : String
    
    
}

var movieData = [
    MovieModel(id: 0, name: "Luca", poster: "/jTswp6KyDYKtvC52GbHagrZbGvD.jpg"),
    MovieModel(id: 11, name: "Infinite", poster: "/niw2AKHz6XmwiRMLWaoyAOAti0G.jpg"),
    MovieModel(id: 12, name: "F9", poster: "/qIicLxr7B7gIt5hxZxo423BJLlK.jpg"),
    MovieModel(id: 9, name: "A Quiet Place PART II", poster: "/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg"),
    MovieModel(id: 4, name: "Cruella", poster: "/rTh4K5uw9HypmpGslcKd4QfHl93.jpg"),
    MovieModel(id: 51, name: "The Tomorrow War", poster: "/xipF6XqfSYV8DxLqfLN6aWlwuRp.jpg"),
    MovieModel(id: 6, name: "Wrath of Man", poster: "/M7SUK85sKjaStg4TKhlAVyGlz3.jpg"),
    MovieModel(id: 74, name: "Fast And Furious 10", poster: "/2DyEk84XnbJEdPlGF43crxfdtHH.jpg"),
    MovieModel(id: 8, name: "The Conjuring", poster: "/xbSuFiJbbBWCkyCCKIMfuDCA4yV.jpg"),
    MovieModel(id: 94, name: "Spirit", poster: "/5cbGVDmRMYVzkq5cItZ7cYlDdDR.jpg"),
    MovieModel(id: 10, name: "Army Of Death", poster: "/z8CExJekGrEThbpMXAmCFvvgoJR.jpg"),
    MovieModel(id: 11, name: "Boss Baby", poster: "/5dExO5G2iaaTxYnLIFKLWofDzyI.jpg"),
    MovieModel(id: 12, name: "Awake", poster: "/uZkNbB8isWXHMDNoIbqXvmslBMC.jpg"),
]

var basePath = "https://image.tmdb.org/t/p/w500"

