//
//  ViewController.swift
//  PostFeed
//
//  Created by Ridoan Wibisono on 30/07/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tbl_post: UITableView!
	
	var users = [Users]()
	var posts = [Posts]()
	var movies = [Movie]()
	
	var selelectedRow = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		//		NetworkAPI().getPosts()
		//		NetworkAPI().getComments()
		//		NetworkAPI().getAlbums()
		//		NetworkAPI().getPhotos()
	
//		NetworkAPI().getFilm()
		
		fetchUser()
		
		tbl_post.delegate = self
		tbl_post.dataSource = self
		tbl_post.rowHeight = UITableView.automaticDimension
		tbl_post.estimatedRowHeight = 300

//		NetworkAPI().getAlbums()
	}
	
	func fetchUser(){
		
		let group = DispatchGroup()
		group.enter()
		NetworkAPI().getUsers{ result in
			switch result{
			case .failure(let error) :
				print(error.localizedDescription)
			case .success(let user):
				self.users = user
			}
			group.leave()
		}
		
		
//		group.enter()
//		NetworkAPI().getPosts(){ result in
//			switch result{
//			case .failure(let error) :
//				print(error.localizedDescription)
//			case .success(let post):
//				self.posts = post
//			}
//			group.leave()
//		}
		
		group.enter()
		NetworkAPI().getMovies(){ result in
			switch result{
			case .failure(let error) :
				print(error.localizedDescription)
				print("lk21 error")
			case .success(let movies):
				self.movies = movies.result
				print(movies)
			}
			group.leave()
		}
		
		
		group.notify(queue: .main){
//			for i in self.posts{
//				print("\n \(i.id)")
//				print("\(i.userId) - \(self.users[i.userId - 1])")
//			}
			
			self.tbl_post.reloadData()
			
		}
		
	}
	
	
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return posts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath  as IndexPath) as! PostTableViewCell
		
		cell.title_tf.text = posts[indexPath.row].title
		cell.body_tf.text = posts[indexPath.row].body
		cell.username_btn.setTitle(users[posts[indexPath.row].userId - 1].username
								   , for: .normal)
		cell.company_tf.text = users[posts[indexPath.row].userId - 1].company.name
		cell.actionBlock = {
			   //Do whatever you want to do when the button is tapped here
//			print("\(self.users[self.posts[indexPath.row].userId - 1])")
			}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selelectedRow = indexPath.row
		performSegue(withIdentifier: "postDetail", sender: self)
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "postDetail" {
			let viewController = segue.destination as! PostDetailViewController
			viewController.user = [self.users[self.posts[selelectedRow].userId - 1]]
			viewController.post = [self.posts[selelectedRow]]
	}
	
	}
}


class PostTableViewCell: UITableViewCell {
	
	@IBOutlet weak var title_tf: UILabel!
	@IBOutlet weak var body_tf: UILabel!
	@IBOutlet weak var username_btn: UIButton!
	@IBOutlet weak var company_tf: UILabel!
	
	var actionBlock: (() -> Void)? = nil
	
	@IBAction func didTapButton(sender: UIButton) {
		   actionBlock?()
	   }
}
