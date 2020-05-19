//
//  CustomTabBarController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 17/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

/*
class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

    //MARK: - PROPERTIES
    /*
    var homeViewController: HomeViewController!
    var addStaffViewController: AddStaffViewController!
    var profileViewController: ProfileViewController!
    */
    //
    
    var firstTabNavigationController: UINavigationController!
    var secondTabNavigationController: UINavigationController!
    var thirdTabNavigationController: UINavigationController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        homeViewController = HomeViewController()
        addStaffViewController = AddStaffViewController()
        profileViewController = ProfileViewController()
        
        self.delegate = self
        
        homeViewController.tabBarItem.image = UIImage(named: "animal-cat")
        
        addStaffViewController.tabBarItem.image = UIImage(named: "animal-chicken")
        
        profileViewController.tabBarItem.image = UIImage(named: "animal-cow")
        
        viewControllers = [homeViewController, addStaffViewController, profileViewController]
        
        for tabBarItem in tabBar.items! {
            tabBarItem.title = ""
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        */
 
        //
        
        viewControllers = [firstTabNavigationController, secondTabNavigationController, thirdTabNavigationController]
        
        let item1 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let item2 = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        let item3 = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2
        thirdTabNavigationController.tabBarItem = item3
        
    }
    
 
}
*/

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    
    
    override func viewDidLoad() {
        setupTabBar()
    }
    
    //MARK: - SETUP UI
    func setupTabBar() {
        let homeViewController = HomeViewController()
        let addStaffViewController = AddStaffViewController()
        let profileViewController = ProfileViewController()
        
        let tabBarController = UITabBarController()
        
        let item1 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let item2 = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        let item3 = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        homeViewController.tabBarItem = item1
        addStaffViewController.tabBarItem = item2
        profileViewController.tabBarItem = item3
        
        tabBarController.viewControllers = [homeViewController, addStaffViewController, profileViewController]
        
        view.addSubview(tabBarController.view)
    }
}
