//
//  CustomTabBarVC.swift
//  CustomTabBar
//
//  Created by Ridoan Wibisono on 26/07/21.
//

import Foundation
import UIKit

class CustomTabBarVC : UITabBarController, UITabBarControllerDelegate{
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.delegate = self
		self.selectedIndex = 0
//		setupHomeButton()
	}
	
	
	
	func setupHomeButton(){
		let homeButton = UIButton(frame: CGRect(x: self.view.bounds.width / 3 , y: 10, width: 25, height: 25))
		homeButton.setBackgroundImage(UIImage(systemName:"house.fill"), for: .normal)
		homeButton.layer.shadowColor = UIColor.black.cgColor
		homeButton.layer.shadowOpacity = 0.1
		homeButton.layer.shadowOffset = CGSize(width: 4, height: 4)
		
		self.tabBar.addSubview(homeButton)
		homeButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
		self.view.layoutIfNeeded()
	}
	
	@objc func menuButtonAction(sender: UIButton){
		self.selectedIndex = 1
	}
	
	
	
}
