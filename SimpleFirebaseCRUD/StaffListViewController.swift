//
//  StaffListViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 18/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class StaffListViewController: UIViewController {

    //MARK: - PROPERTIES
    let stackView = UIStackView()
    
    let items = ["Table View", "Collection View"]
    var segmentedControl = UISegmentedControl()
    
    let staffTableListViewController = StaffTableListViewController()
    let staffCollectionListViewController = StaffCollectionListViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupSegmentedControl()
        //setupSearchBarLabel()
        setupStackView()
        addChildStaffTableList()
        addChildStaffCollectionList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear from StaffListViewController")
    }
    
    //MARK: - SETUP UI
    func addChildStaffTableList() {
        addChild(staffTableListViewController)
        view.addSubview(staffTableListViewController.view)
        staffTableListViewController.didMove(toParent: self)
        setChildStaffTableListConstraints()
    }
    
    func addChildStaffCollectionList() {
        addChild(staffCollectionListViewController)
        view.addSubview(staffCollectionListViewController.view)
        staffCollectionListViewController.didMove(toParent: self)
        setChildStaffCollectionListConstraints()
        
        //Awal awal di hidden dulu supaya yang muncul pertama table view
        staffCollectionListViewController.view.isHidden = true
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(segmentedControl)

        setStackViewConstraints()
    }
    
    func setupSegmentedControl() {
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
    }
    
    //MARK: - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func setSegmentedControlConstraints() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setChildStaffTableListConstraints() {
        staffTableListViewController.view.translatesAutoresizingMaskIntoConstraints = false
        staffTableListViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        staffTableListViewController.view.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        staffTableListViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        staffTableListViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setChildStaffCollectionListConstraints() {
        staffCollectionListViewController.view.translatesAutoresizingMaskIntoConstraints = false
        staffCollectionListViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        staffCollectionListViewController.view.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        staffCollectionListViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        staffCollectionListViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func segmentedControlChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("Case 0")
            staffTableListViewController.view.isHidden = false
            staffCollectionListViewController.view.isHidden = true
        case 1:
            print("Case 1")
            staffCollectionListViewController.view.isHidden = false
            staffTableListViewController.view.isHidden = true
        default:
            break
        }
    }
}
