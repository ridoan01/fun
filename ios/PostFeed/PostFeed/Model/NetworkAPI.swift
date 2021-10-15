//
//  Network.swift
//  PostFeed
//
//  Created by Ridoan Wibisono on 30/07/21.
//

import Foundation

enum APIError : Error {
	case noDataAvailable
	case canNotProcessData
}


class NetworkAPI {
	let session = URLSession.shared
	
	func getPosts(completion: @escaping (Result<[Posts], APIError>) -> Void) {
		let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
		
		let task = URLSession.shared.dataTask(with: url){ data, _, _ in
			guard let jsonData = data else{
				completion(.failure(.noDataAvailable))
				return
			}
			
			do{
				let decoder = JSONDecoder()
				let postsResp = try decoder.decode([Posts].self, from: jsonData)
				completion(.success(postsResp))
			}catch{
				completion(.failure(.canNotProcessData))
			}
		}
		task.resume()
	
	}
	
	func getComments() -> Void {
		let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!
		
		let task = session.dataTask(with: url){ data, response, error in
			
			if error != nil || data == nil {
				print("Client Error")
				return
			}
			
			guard let response = response as? HTTPURLResponse, (200...299).contains( response.statusCode)
			else { print("Server Error")
				return
			}
			
			guard let mime = response.mimeType, mime == "application/json" else{
				print("Wrong MIME type")
				return
			}
			
			do{
				let json = try JSONSerialization.jsonObject(with: data!, options: [])
				print(json)
				
			}catch{
				print("JSON error: \(error.localizedDescription)")
			}
			
		}
		task.resume()
	}
	
	func getAlbums() -> Void {
		let url = URL(string: "https://jsonplaceholder.typicode.com/albums")!
		
		let task = session.dataTask(with: url){ data, response, error in
			
			if error != nil || data == nil {
				print("Client Error")
				return
			}
			
			guard let response = response as? HTTPURLResponse, (200...299).contains( response.statusCode)
			else { print("Server Error")
				return
			}
			
			guard let mime = response.mimeType, mime == "application/json" else{
				print("Wrong MIME type")
				return
			}
			
			do{
				let json = try JSONSerialization.jsonObject(with: data!, options: [])
				print(json)
				
			}catch{
				print("JSON error: \(error.localizedDescription)")
			}
			
		}
		task.resume()
	}
	
	func getPhotos() -> Void {
		let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
		
		let task = session.dataTask(with: url){ data, response, error in
			
			if error != nil || data == nil {
				print("Client Error")
				return
			}
			
			guard let response = response as? HTTPURLResponse, (200...299).contains( response.statusCode)
			else { print("Server Error")
				return
			}
			
			guard let mime = response.mimeType, mime == "application/json" else{
				print("Wrong MIME type")
				return
			}
			
			do{
				let json = try JSONSerialization.jsonObject(with: data!, options: [])
				print(json)
				
			}catch{
				print("JSON error: \(error.localizedDescription)")
			}
			
		}
		task.resume()
	}
		
	func getUsers(completion: @escaping (Result<[Users], APIError>) -> Void) {
		let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
		
		let task = URLSession.shared.dataTask(with: url){ data, _, _ in
			guard let jsonData = data else{
				completion(.failure(.noDataAvailable))
				return
			}
			
			do{
				let decoder = JSONDecoder()
				let userResp = try decoder.decode([Users].self, from: jsonData)
				let userDetail = userResp
				completion(.success(userDetail))
			}catch{
				completion(.failure(.canNotProcessData))
			}
		}
		task.resume()
	
	}
	
	func getMovies(completion: @escaping (Result<MovieList, APIError>) -> Void) {
		let url = URL(string: "https://api-filmapik.herokuapp.com/latest?page=1")!
		
		let task = URLSession.shared.dataTask(with: url){ data, response, error in
			guard let jsonData = data else{
				completion(.failure(.noDataAvailable))
				return
			}
			
			do{
				let decoder = JSONDecoder()
				let movieResp = try decoder.decode(MovieList.self, from: jsonData)
				let userDetail = movieResp
				completion(.success(userDetail))
			}catch{
				completion(.failure(.canNotProcessData))
			}
		}
		task.resume()
	
	}
	
	
	func getFilm() -> Void {
		let url = URL(string: "https://api-filmapik.herokuapp.com/latest?page=1")!
		
		let task = session.dataTask(with: url){ data, response, error in
			
			if error != nil || data == nil {
				print("Client Error")
				return
			}
			
			guard let response = response as? HTTPURLResponse, (200...299).contains( response.statusCode)
			else { print("Server Error")
				return
			}
			
			guard let mime = response.mimeType, mime == "application/json" else{
				print("Wrong MIME type")
				return
			}
			
			do{
				let json = try JSONSerialization.jsonObject(with: data!, options: [])
				print(json)
				
			}catch{
				print("JSON error: \(error.localizedDescription)")
			}
			
		}
		task.resume()
	}
}





struct MovieList: Codable {
//    #warning("FIX ME")
	var result : [Movie]
	var page : String
}

struct Movie: Codable {
//    #warning("FIX ME")
	var title : String
	var thumbnailPotrait : String
	var rating : String
	var quality : String
	var movieId : String
	var detail : Detail
}

struct Detail: Codable {
//    #warning("FIX ME")
	var release : String
	var description : String
}
