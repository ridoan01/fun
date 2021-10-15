//
//  MovieService.swift
//  BoilerPlate
//
//  Created by Ridoan Wibisono on 06/10/21.
//

import Foundation
import Combine

protocol Imovies {
	
	func requestMovieList() -> AnyPublisher<Result<MovieList, Error>, Never>
	
	func loadMoreMovies(page: Int) -> AnyPublisher<Result<MovieList, Error>, Never>
}


struct MovieServices : Imovies{
	private var api : BaseService = BaseService()
	
	func requestMovieList() -> AnyPublisher<Result<MovieList, Error>, Never> {
		let url = ApiConstants.baseUrl + "\(1)"
		return api
			.request(urlString: url)
			.map{ .success($0)}
			.catch { error -> AnyPublisher<Result<MovieList, Error>, Never> in .just(.failure(error)) }
			.subscribe(on: Scheduler.backgroundWorkScheduler)
			.receive(on: Scheduler.mainScheduler)
			.eraseToAnyPublisher()
		
	}
	
	func loadMoreMovies(page: Int) -> AnyPublisher<Result<MovieList, Error>, Never> {
		let url = ApiConstants.baseUrl + "\(page)"
		return api
			.request(urlString: url)
			.map{ .success($0)}
			.catch { error -> AnyPublisher<Result<MovieList, Error>, Never> in .just(.failure(error)) }
			.subscribe(on: Scheduler.backgroundWorkScheduler)
			.receive(on: Scheduler.mainScheduler)
			.eraseToAnyPublisher()
	}
}
