//
//  AppDelegate.swift
//  FoodRecipe
//
//  Created by Ridoan Wibisono on 16/10/21.
//

import UIKit

@main
class AppDelegate : UIResponder, UIApplicationDelegate{
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow(frame: UIScreen.main.bounds)
		
		
			// Set up the first View Controller
		let vc1 = HomeViewController()
		vc1.tabBarItem.title = "Home"
		vc1.tabBarItem.image = UIImage(systemName: "house")
		
			// Set up the second View Controller
		let vc2 = BookmarkViewController()
		vc2.tabBarItem.title = "Like"
		vc2.tabBarItem.image = UIImage(systemName: "heart")
		
			// Set up the Tab Bar Controller to have two tabs
		let tabBarController = UITabBarController()
		tabBarController.viewControllers = [vc1, vc2]
		
			// Make the Tab Bar Controller the root view controller
		window?.rootViewController = tabBarController
		window?.makeKeyAndVisible()
		
		return true
	}

	
}
