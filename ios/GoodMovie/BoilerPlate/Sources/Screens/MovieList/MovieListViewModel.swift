//
//  MovieListViewModel.swift
//  BoilerPlate
//
//  Created by Ridoan Wibisono on 07/10/21.
//

import Foundation
import Combine

class MovieListViewModel {
	
	private let service : Imovies
	
	var movies  = CurrentValueSubject<[Movie], Never>([Movie]())
	var cancellables : Set<AnyCancellable> = []
	
	init(service: Imovies = MovieServices()) {
		self .service = service
		fecth()
	}
	
	func fecth(){
		service.requestMovieList()
			.receive(on: DispatchQueue.main)
			.sink { completion in
				switch completion {
				case .failure(let error):
					print(error)
				case .finished:
					break
				}
			}
			receiveValue : {[weak self] response in
				switch response{
				case .failure(let error):
					print(error)
				case.success(let mResponse):
					self?.movies.send(mResponse.result)
				}
			}.store(in: &cancellables)
	}
}
