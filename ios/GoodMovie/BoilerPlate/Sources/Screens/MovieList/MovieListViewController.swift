//
//  MovieListViewController.swift
//  BoilerPlate
//
//  Created by Ridoan Wibisono on 07/10/21.
//

import UIKit
import Combine


class MovieListViewController: UIViewController {
	@IBOutlet weak var movieTable : UITableView!
	
	private var viewModel = MovieListViewModel()
	private var cancellables: Set<AnyCancellable> = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		movieTable.dataSource = self
		movieTable.delegate = self
		
		let nib = UINib.init(nibName: "MovieListTableViewCell", bundle: nil)
		movieTable.register(nib, forCellReuseIdentifier: "movieListTableViewCell")
		setup()
	}
	
	fileprivate func setup(){
		viewModel.movies.sink { [unowned self] (_) in
			self.movieTable.reloadData()
		}.store(in: &cancellables)
		
	}
	
	@IBAction func closeThis(_ sender: UINavigationItem){
		self.dismiss(animated: true, completion: nil)
	}
}

extension MovieListViewController : UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.movies.value.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "movieListTableViewCell", for: indexPath) as! MovieListTableViewCell
		cell.textLabel?.text = "cell \(viewModel.movies.value[indexPath.row].title )"
		
		return cell
	}
	
}

