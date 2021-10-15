//
//  MovieServices.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 01/10/21.
//

import Foundation
import Combine

protocol MovieUseCaseProtocol : AnyObject {
	var networkService: NetworkServiceType {get}
	// Fetch Movie List
	func fecthMovies() -> AnyPublisher<Result<MovieListResponse, Error>, Never>
	
	// Fetch More Movies
	func fecthMoreMovies(page: Int) -> AnyPublisher<Result<MovieListResponse, Error>, Never>
	
	// Get Movie Detail
	func fetchMovieDetail(id: Int) -> AnyPublisher<Result<MovieDetail, Error>,Never>
}


final class MovieUseCase : MovieUseCaseProtocol {
	
	var networkService: NetworkServiceType
	
	init(networkService : NetworkServiceType = NetworkService()) {
		self.networkService = networkService
	}
	
	func fecthMovies() -> AnyPublisher<Result<MovieListResponse, Error>, Never> {
		return networkService
			.Load(Resource<MovieListResponse>.movies())
			.map { .success($0) }
			.catch { error -> AnyPublisher<Result<MovieListResponse, Error>, Never> in .just(.failure(error)) }
			.subscribe(on: Scheduler.backgroundWorkScheduler)
			.receive(on: Scheduler.mainScheduler)
			.eraseToAnyPublisher()
	}
	
	func fecthMoreMovies(page: Int) -> AnyPublisher<Result<MovieListResponse, Error>, Never> {
		return networkService
			.Load(Resource<MovieListResponse>.moreMovies(page: page))
			.map { .success($0) }
			.catch { error -> AnyPublisher<Result<MovieListResponse, Error>, Never> in .just(.failure(error)) }
			.subscribe(on: Scheduler.backgroundWorkScheduler)
			.receive(on: Scheduler.mainScheduler)
			.eraseToAnyPublisher()
	}
	
	func fetchMovieDetail(id: Int) -> AnyPublisher<Result<MovieDetail, Error>, Never> {
		return networkService
			.Load(Resource<MovieDetail>.movieDetail(id: id))
			.map { .success($0) }
			.catch { error -> AnyPublisher<Result<MovieDetail, Error>, Never> in .just(.failure(error)) }
			.subscribe(on: Scheduler.backgroundWorkScheduler)
			.receive(on: Scheduler.mainScheduler)
			.eraseToAnyPublisher()
	}
}

