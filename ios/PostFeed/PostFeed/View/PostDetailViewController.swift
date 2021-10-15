//
//  PostDetailViewController.swift
//  PostFeed
//
//  Created by Ridoan Wibisono on 31/07/21.
//

import UIKit

class PostDetailViewController: UIViewController {
	@IBOutlet weak var title_lbl: UILabel!
	@IBOutlet weak var body_lbl: UILabel!
	@IBOutlet weak var username_btn: UIButton!
	@IBOutlet weak var company_lbl: UILabel!
	
	var user = [Users]()
	var post = [Posts]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		
		title_lbl.text = post[0].title
		body_lbl.text = post[0].body
		username_btn.setTitle(user[0].username, for: .normal)
		company_lbl.text = user[0].company.name
		
		
		
		
		
    }
    

}
