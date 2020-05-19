//
//  HomeViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 11/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - PROPERTIES
    let tabBar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTabBar()
        view.backgroundColor = .purple
    }
    
    //MARK: - SETUP UI
    func setupTabBar() {
        let staffListViewController = StaffListViewController()
        staffListViewController.title = "Staff List"
        
        let addStaffViewController = AddStaffViewController()
        addStaffViewController.title = "Add Staff"
        
        let profileViewController = ProfileViewController()
        profileViewController.title = "Profile"
        
        let navigationController1 = UINavigationController(rootViewController: staffListViewController)
        //let navigationController1 = UINavigationController(rootViewController: StaffTableListViewController())
        
        let navigationController2 = UINavigationController(rootViewController: addStaffViewController)
        
        let navigationController3 = UINavigationController(rootViewController: profileViewController)
        
        //let item1 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        //let item2 = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        //let item3 = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        //staffListViewController.tabBarItem = item1
        //addStaffViewController.tabBarItem = item2
        //profileViewController.tabBarItem = item3
        
        //navigationController1.tabBarItem = item1
        //navigationController2.tabBarItem = item2
        //navigationController3.tabBarItem = item3
        
        //tabBar.viewControllers = [staffListViewController, addStaffViewController, profileViewController]
        tabBar.viewControllers = [navigationController1, navigationController2, navigationController3]
        
        //tabBar.selectedIndex = 2
        
        self.view.addSubview(tabBar.view)
    }
}
