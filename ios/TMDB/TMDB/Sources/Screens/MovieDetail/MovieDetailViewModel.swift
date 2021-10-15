//
//  MovieDetailViewModel.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 02/10/21.
//

import Foundation
import Combine

class MovieDetailViewModel : ObservableObject{
	@Published public var movieDetail = MovieDetail.fakeMovieDetail()
	
	public let movieId : Int
	
	private var movieUseCase : MovieUseCaseProtocol
	var cancellables = Set<AnyCancellable>()
	
	init(movieId: Int, movieUseCase: MovieUseCaseProtocol = MovieUseCase()) {
		self.movieId = movieId
		self.movieUseCase = movieUseCase
		fetchMovieDetail()
	}
	
	private func fetchMovieDetail(){
		print("fetch \(movieId)")
		getDetail(Id: movieId)
	}
	
	
	private func getDetail(Id: Int){
		movieUseCase.fetchMovieDetail(id: Id)
			.receive(on: DispatchQueue.main)
			.sink { completion in
				switch completion {
				case .failure(let error):
					print(error)
				case .finished:
					print("finished")
					break
				}
			}
			receiveValue: { [weak self] response in
				switch response{
				case .failure(let error):
					print(error)
				case .success(let mResponse):
					self?.movieDetail = mResponse
				}
			}.store(in: &cancellables)
	}
}
