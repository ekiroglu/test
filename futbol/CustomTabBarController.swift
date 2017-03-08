//
//  CustomTabBarController.swift
//  futbol
//
//  Created by Erol Kiroglu on 07/03/17.
//  Copyright © 2017 Potato Apps. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewLayout()
        
        
        viewControllers = [createDummyNavControllerWithTitle(title: "Profil", imageName: "friends_icon"), createDummyNavControllerWithTitle(title: "Flow", imageName: "Group"), createDummyNavControllerWithTitle(title: "Search", imageName: "searchbtn")]
    }
    
    private func createDummyNavControllerWithTitle(title: String, imageName: String) -> UINavigationController {
    
    let viewController = UIViewController()
    let navController = UINavigationController(rootViewController: viewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(named: imageName)
    return navController
}

}
