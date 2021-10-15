//
//  ViewController.swift
//  BoilerPlate
//
//  Created by Ridoan Wibisono on 06/10/21.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var btn_movieList: UIButton!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
	}
	
	@IBAction func goToMovieList(_ sender: Any) {
		let vc = MovieListViewController()
		vc.modalPresentationStyle = .formSheet
		self.present(vc, animated: true, completion: nil)
		
	}
	

}

