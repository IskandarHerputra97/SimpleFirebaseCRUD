//
//  StaffTableListViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 19/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class StaffTableListViewController: UIViewController {

    //MARK: - PROPERTIES
    let tableView = UITableView()
    let testText = UILabel()
    //let dispatchGroup = DispatchGroup()
    //let staffStruct = Staff()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        //staffStruct.requestData()
        //staffList = fetchData()
        
        //staffStruct.fetchData()
        
        //fetchData()
        //setupTableView()
        //fetchData()
        
        fetchData()
//        fetchData()
//        fetchData()
//        fetchData()
//        fetchData()
        //print(staffList)
        setupTableView()
        
        //tableView.reloadData()
       
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            if staffList.count == 0 {
                self.tableView.reloadData()
            }
        }
        
        
        /*
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        */
 
        //setupTestText()
        
        print("View did load from StaffTableListViewController")
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear from StaffTableListViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View did appear from StaffTableListViewController")
    }
    
    //MARK: - SETUP UI
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 100
        
        tableView.register(StaffCell.self, forCellReuseIdentifier: "StaffCell")
        
        setTableViewConstraints()
    }
    
    func setupTestText() {
        view.addSubview(testText)
        
        testText.text = "Table view page"
        //testText.textAlignment = .center
        
        setTestTextConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setTestTextConstraints() {
        testText.translatesAutoresizingMaskIntoConstraints = false
    }

}

extension StaffTableListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 3
        return staffList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StaffCell") as! StaffCell
        let staff = staffList[indexPath.row]
        cell.set(staff: staff)
        
        return cell
    }
}
