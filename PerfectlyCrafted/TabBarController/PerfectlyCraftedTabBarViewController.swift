//
//  PerfectlyCraftedTabBarViewController.swift
//  PerfectlyCrafted
//
//  Created by Ashli Rankin on 2/5/19.
//  Copyright © 2019 Ashli Rankin. All rights reserved.
//

import UIKit

final class PerfectlyCraftedTabBarViewController: UITabBarController {
    
    private let persistenceController: PersistenceController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabbarItems()
        transparentTabbarController()
    }
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTabbarItems() {
        let feedsViewController = UIStoryboard(name: "Feeds", bundle: Bundle.main).instantiateViewController(identifier: "PostViewController", creator: { coder in
            return PostViewController(coder: coder, persistenceController: self.persistenceController)
        })
        let newsFeedNavigationController = UINavigationController(rootViewController: feedsViewController)
       
        let pd = UIStoryboard(name: "ProductDetail", bundle: Bundle.main).instantiateViewController(identifier: "ProductDetailViewController")
        
        tabBar.tintColor = .black
        feedsViewController.tabBarItem.image = .entries
        pd.tabBarItem.image = .pages
        self.viewControllers = [newsFeedNavigationController, pd]
    }
}
