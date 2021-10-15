//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Ridoan Wibisono on 01/10/21.
//

import Foundation
import Combine

class MovieListViewModel : ObservableObject{
	
	@Published public var movies = [Movie]()
	@Published public var isLoading = false
	
	private var resp : MovieListResponse?
	private var currPage = 0
	private var totalPages = 1
	private var totalResult = 0
	private let useCase : MovieUseCaseProtocol
	var cancellables = Set<AnyCancellable>()
	
	init(useCase : MovieUseCaseProtocol = MovieUseCase(),
		 movies : [Movie] = []){
		
		self.useCase = useCase
		self.movies = movies
		fetchMovies()
	}
	
	public func formatRating(float: Float) -> String{
		return String(format: "%.1f", float)
	}
	
	
	public func loadMoreIfNeeded(currentMovie movie : Movie?){
		guard let movie = movie else {
			fetchMovies()
			return
		}
		let thresholdIndex = movies.index(movies.endIndex, offsetBy: -5)
		if movies.firstIndex(where: { $0.id == movie.id }) == thresholdIndex {
			fetchMovies()
		}
	}
	
	
	private func fetchMovies(){
		guard !isLoading  else { return }
		guard (currPage < totalPages) == true else { return }
		
		isLoading = true
		currPage += 1
		useCase.fecthMoreMovies(page: currPage)
			.receive(on: DispatchQueue.main)
			.sink { completion in
				switch completion {
				case .failure(let error):
					print(error)
				case .finished:
					self.isLoading = false
					print("finished")
					break
				}
			}
			receiveValue: { [weak self] response in
				switch response{
				case .failure(let error):
					print(error)
				case .success(let mResponse):
					self?.movies += mResponse.results
					self?.resp = mResponse
					self?.totalPages = mResponse.total_pages
					self?.totalResult = mResponse.total_results
				}
			}.store(in: &cancellables)
		
	}
	
	public func dateFormater(str: String) -> String{
		let inputFormatter = DateFormatter()
		inputFormatter.dateFormat = "yyyy-MM-dd"
		let showDate = inputFormatter.date(from: str)
		inputFormatter.dateFormat = "MMMM dd, yyyy"
		let resultString = inputFormatter.string(from: showDate!)
		return resultString
	}
}


