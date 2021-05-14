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
        
        let feed = FeedController()
        
        let search = SearchController()
        
        let profile = ProfileController()
        
        let imageSelector = ImageSelectorController()
        
        let notification = NotificationController()
        
        
        viewControllers = [feed, search, profile, imageSelector, notification]
    }
    
}
