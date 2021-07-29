//
//  MovieModel.swift
//  MovieCatalog
//
//  Created by Ridoan Wibisono on 12/07/21.
//

import Foundation
import SwiftUI

struct MovieModel : Identifiable {
    var id : Int
    var name : String
    var poster : String
    var backdrop : String
    
}

var movies = [
    MovieModel(id: 497698, name: "Black Widow", poster: "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg", backdrop : "/ApH5y0E92GiAYzFJPNLDws3v5oK.jpg"),
    MovieModel(id: 522478, name: "Peter Rabbit 2: The Runaway", poster: "/cycDz68DtTjJrDJ1fV8EBq2Xdpb.jpg", backdrop: "/3WZb1d2XPfHoaJOFf21cRpcIDaX.jpg"),
    MovieModel(id: 460465, name: "Mortal Kombat", poster: "/nkayOAUBUu4mMvyNf9iHSUiPjF1.jpg", backdrop : "/KagelnFliqyASY0SM6OxldtUPL.jpg"),
    MovieModel(id: 591273, name: "Fear Street: 1994", poster: "/9J9Wy39ZjrVmfk7yMkulpcI5sy0.jpg", backdrop : "/cBRrYjxB4dHVTR9mILg9KJXVnkE.jpg"),
    MovieModel(id: 591275, name: "Fear Street: 1666", poster: "/rmEPtz3Ufzol2VWUAZYzOFaBio3.jpg", backdrop: "/xBt5MV06n6YupZIEnrr2GCnAUiL.jpg"),
    MovieModel(id: 834404, name: "Teen Titans Go! See Space Jam", poster: "/j0pJ7e2ZGdzo9yEV7c6TLBue8Co.jpg", backdrop: "/j0pJ7e2ZGdzo9yEV7c6TLBue8Co.jpg"),
    MovieModel(id: 649409, name: "No Sudden Move", poster: "/34BmdJkdvRweC3xJJFlOFQ2IbYc.jpg", backdrop : "/UEWwgGgSJPVSDbxXWqNIbc2DQr.jpg"),
    MovieModel(id: 508943, name: "Luca", poster: "/jTswp6KyDYKtvC52GbHagrZbGvD.jpg", backdrop : "/6jiFOEdH0hFg7p0U7HFXwO24W4F.jpg"),
    MovieModel(id: 385128, name: "F9", poster: "/qIicLxr7B7gIt5hxZxo423BJLlK.jpg", backdrop : "/oQY4vAwfwmQQsiSQNR6TCRqQ4TG.jpg"),
    MovieModel(id: 520763, name: "A Quiet Place PART II", poster: "/4q2hz2m8hubgvijz8Ez0T2Os2Yv.jpg", backdrop : "/tJRSV7UsuLb65svcEASDFmt4k30.jpg"),
    MovieModel(id: 337404, name: "Cruella", poster: "/rTh4K5uw9HypmpGslcKd4QfHl93.jpg", backdrop : "/57Jl9wB8Fv37S06z9mwfyoSpHof.jpg"),
    MovieModel(id: 588228, name: "The Tomorrow War", poster: "/xipF6XqfSYV8DxLqfLN6aWlwuRp.jpg", backdrop : "/80OePJ6cOp7yEkZ3bknA6DRRqSD.jpg"),
    MovieModel(id: 637649, name: "Wrath of Man", poster: "/M7SUK85sKjaStg4TKhlAVyGlz3.jpg", backdrop : "/x9ZsjNiaqQ1HbIAkrNDaYNDtEzR.jpg"),
    MovieModel(id: 503736, name: "Army Of Death", poster: "/z8CExJekGrEThbpMXAmCFvvgoJR.jpg", backdrop : "/t7MJ1fZ1w6vt5yaTiWQQUPik2bg.jpg"),
    MovieModel(id: 459151, name: "Boss Baby", poster: "/5dExO5G2iaaTxYnLIFKLWofDzyI.jpg", backdrop : "/re1ftRjOrxGyKKmDAk2GTrVDwbU.jpg"),
    MovieModel(id: 615658, name: "Awake", poster: "/uZkNbB8isWXHMDNoIbqXvmslBMC.jpg", backdrop : "/d9Abkl4zClXqTGOX2pSn4mvI7jG.png"),
    MovieModel(id: 379686, name: "Space Jam: A New Legacy", poster: "/5bFK5d3mVTAvBCXi5NPWH0tYjKl.jpg", backdrop: "/zkkTotsHQw519Z4P1gSbdXwCXUr.jpg"),
    MovieModel(id: 602223, name: "The Forever Purge", poster: "/uHA5COgDzcxjpYSHHulrKVl6ByL.jpg", backdrop: "/xZREWTHWpKlgpYtA6LsNeReUOcj.jpg"),
    MovieModel(id: 581726, name: "Infinite", poster: "/niw2AKHz6XmwiRMLWaoyAOAti0G.jpg", backdrop: "/pT7Q2l3x6jplHhX6O911ejxTmd1.jpg")
]

var basePath = "https://image.tmdb.org/t/p/w500"

