//
//  MainTabBarController.swift
//  InstagramAppClone
//
//  Created by Ayodeji Ayankola on 5/13/21.
//

import Foundation
import UIKit
class MainTabBarController: UITabBarController {
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    
    // MARK:- Helpers
    func configureViewController() {
        view.backgroundColor = .white
        //let feed = FeedController()
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_unselected"), rootViewController: FeedController(collectionViewLayout: layout))
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        let profile = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController())
        let imageSelector = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        let notification =  templateNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())
        tabBar.tintColor = .black
        viewControllers = [feed, search, profile, imageSelector, notification]
    }
        
    func templateNavigationController(unselectedImage: UIImage , selectedImage: UIImage , rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
        
    }
}
