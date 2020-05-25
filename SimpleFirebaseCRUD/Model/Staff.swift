//
//  Staff.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 21/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import Foundation
import UIKit

//1. fetch data
//2. Map data sesuai struct
//3. simpan data pada array

var staffList = [Staff]()
//let dispatchGroup = DispatchGroup()

struct Staff {
    var name: String
    var phoneNumber: String
    var email: String
    var salary: Int
    var age: Int
    var address: String
}

//func requestData(completion: ((_ data: Staff) -> Void)) {
//    let data = fetchData()
//
//    completion(data)
//}
/*
func fetchData() {
    //dispatchGroup.enter()
    
    let staffTableListViewController = StaffTableListViewController()
    
    //print("staffList array before fetching = \(staffList)")
    
    let staff1 = Staff(image: UIImage(named: "bill-gates")!, name: "Bill Gates")
    let staff2 = Staff(image: UIImage(named: "jeff-bezos")!, name: "Jeff Bezos")
    let staff3 = Staff(image: UIImage(named: "warren-buffet")!, name: "Warren Buffet")
    
    staffList = [staff1, staff2, staff3]
    
    DispatchQueue.main.async {
        staffTableListViewController.tableView.reloadData()
    }
    
    //staffTableListViewController.tableView.reloadData()
    //print("staffList array after fetching = \(staffList)")
    
    //staffList.append(staff1)
    //staffList.append(staff2)
    //staffList.append(staff3)
    
    //dispatchGroup.leave()
    
//    dispatchGroup.notify(queue: .main) {
//        staffTableListViewController.tableView.reloadData()
//    }
//    DispatchQueue.main.async {
//        staffTableListViewController.tableView.reloadData()
//    }
    
    
//    DispatchQueue.main.async {
//        tableView.reloadData()
//    }

    //return staffList
}
*/
