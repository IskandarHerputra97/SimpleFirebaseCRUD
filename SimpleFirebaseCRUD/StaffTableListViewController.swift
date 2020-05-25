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
    
    let fetchButton = UIButton()
    
    let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    
        //setupTestText()
        //setupFetchButton()
    
        //fetchStaffData()
        networkingClient.getStaffData()
        
        setupTableView()
        
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
        
        //tableView.rowHeight = 100
        
        //tableView.register(StaffCell.self, forCellReuseIdentifier: "StaffCell")
        
        setTableViewConstraints()
    }
    
    func setupTestText() {
        view.addSubview(testText)
        
        testText.text = "Table view page"
        
        setTestTextConstraints()
    }
    
    func setupFetchButton() {
        view.addSubview(fetchButton)
        
        fetchButton.setTitle("Fetch from staff table list", for: .normal)
        
        fetchButton.addTarget(self, action: #selector(fetchButtonTapped(_:)), for: .touchUpInside)
        
        setFetchButtonConstraints()
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
        testText.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    }
    
    func setFetchButtonConstraints() {
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        fetchButton.topAnchor.constraint(equalTo: testText.topAnchor, constant: 20).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func fetchButtonTapped(_ sender: UIButton!) {
        print("fetch button tapped from stafftablelistviewcontroller")
        testText.text = "Edited outside closure - stafftablelistviewcontroller"
    }
    
    func fetchStaffData() {
        print("fetchStaffData for table view")
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts/5") else {
            return
        }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.testText.text = error.localizedDescription
            } else if let json = json {
                self.testText.text = json.description
            }
        }
    }

}

extension StaffTableListViewController: UITableViewDelegate, UITableViewDataSource {
    /*
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
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 30
        //return dummyStaff.count
        //return networkingClient.dummyStaff.count
        return networkingClient.staffData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "TestCell")
        //cell.textLabel?.text = "Test Cell"
        //cell.textLabel?.text = networkingClient.dummyStaff[indexPath.row]
        
        cell.textLabel?.text = networkingClient.staffData[indexPath.row].name
        cell.detailTextLabel?.text = networkingClient.staffData[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(networkingClient.staffData[indexPath.row])
        //print(networkingClient.staffData)
        
        let staffDetailViewController = StaffDetailViewController()
        
        staffDetailViewController.nameLabel.text = networkingClient.staffData[indexPath.row].name
        staffDetailViewController.phoneNumberLabel.text = networkingClient.staffData[indexPath.row].phoneNumber
        staffDetailViewController.emailLabel.text = networkingClient.staffData[indexPath.row].email
        staffDetailViewController.salaryLabel.text = String(networkingClient.staffData[indexPath.row].salary)
        staffDetailViewController.ageLabel.text = String(networkingClient.staffData[indexPath.row].age)
        staffDetailViewController.addressLabel.text = networkingClient.staffData[indexPath.row].address
       
        navigationController?.pushViewController(staffDetailViewController, animated: true)
    }
}
