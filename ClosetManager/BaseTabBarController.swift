//
//  BaseTabBarController.swift
//  ClosetManager
//
//  Created by Aniruddha Borah on 2017-03-21.
//  Copyright © 2017 impy. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControllers()
    }
    
    func setUpControllers() {
        let explorerVC = ExplorerViewController(nibName: "ExplorerViewController", bundle: nil)
        let createItemVC = CreateItemViewController(nibName: "CreateItemViewController", bundle: nil)
        
        let navExplorer = UINavigationController(rootViewController: explorerVC)
        let navCreate = UINavigationController(rootViewController: createItemVC)
        
        navExplorer.tabBarItem = UITabBarItem(
            title: "",
            image: #imageLiteral(resourceName: "search"),
            tag: 1)
        navCreate.tabBarItem = UITabBarItem(
            title: "",
            image: #imageLiteral(resourceName: "add"),
            tag: 1)
        
        self.viewControllers = [navExplorer, navCreate]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
