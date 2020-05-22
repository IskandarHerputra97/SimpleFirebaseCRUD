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
    //Nanti segmented control bisa mengubah list staff dilihat dalam bentuk table view atau collection view
    
    
    let viewList = [StaffTableListViewController().view, StaffCollectionListViewController().view]
    let stackView = UIStackView()
    var segmentedControlLabel = UILabel()
    //let segmentedItems = ["Table View", "Collection View"]
    let items = ["Table View", "Collection View"]
    var segmentedControl = UISegmentedControl()
    let searchBarLabel = UILabel()
    let tableViewLabel = UILabel()
    let collectionViewLabel = UILabel()
    
    let pushButton = UIButton()
    
    var vc = UIView()
    let staffTableListViewController = StaffTableListViewController().view
    let staffCollectionListViewController = StaffCollectionListViewController().view
    var selectedVC: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        segmentedControl.selectedSegmentIndex = 0
        //setupSegmentedControlLabel()
        setupSegmentedControl()
        //setupSearchBarLabel()
        //setupTableViewLabel()
        //setupCollectionViewLabel()
        
        //setupPushButton()
        
        
        setupStackView()
        setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear from StaffListViewController")
        //print("staffList = \(staffList)")
    }
    
    //MARK: - SETUP UI
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        //stackView.spacing = 20
        
        //stackView.addArrangedSubview(segmentedControlLabel)
        stackView.addArrangedSubview(segmentedControl)
        //stackView.addArrangedSubview(searchBarLabel)
        //stackView.addArrangedSubview(tableViewLabel)
        //stackView.addArrangedSubview(collectionViewLabel)
        
        //stackView.addArrangedSubview(pushButton)
        //stackView.addArrangedSubview(vc)
        
        setStackViewConstraints()
    }
    
    func setupVC() {
        //vc = selectedVC ?? staffTableListViewController.view
        view.addSubview(vc)
        vc.addSubview(staffCollectionListViewController!)
        vc.addSubview(staffTableListViewController!)
        
        //setVCConstraints()
        
//        if selectedVC == nil {
//            print("selectedVC == nil")
//            selectedVC = staffTableListViewController.view
//            //selectedVC = staffCollectionListViewController.view
//            //view.addSubview(selectedVC!)
//            vc.addSubview(selectedVC!)
//        }
        
        
        //selectedVC = staffTableListViewController.view
        //vc.addSubview(selectedVC!)
        
        //vc.addSubview(selectedVC.view)
        //vc.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        setVCConstraints()
    }
    
    func setupSegmentedControlLabel() {
        view.addSubview(segmentedControlLabel)
        
        segmentedControlLabel.text = "Segmented control here"
        
        setSegmentedControlLabelConstraints()
    }
    
    func setupSegmentedControl() {
        view.addSubview(segmentedControl)
        //let items = ["Table View", "Collection View"]
        //let segmentedControls = UISegmentedControl(items: items)
        
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        //setSegmentedControlConstraints()
    }
    
    func setupSearchBarLabel() {
        view.addSubview(searchBarLabel)
        
        searchBarLabel.text = "Search bar here"
    }
    
    func setupTableViewLabel() {
        tableViewLabel.text = "Table view here"
    }
    
    func setupCollectionViewLabel() {
        view.addSubview(collectionViewLabel)
        
        collectionViewLabel.text = "Collection view here"
    }
    
    func setupPushButton() {
        view.addSubview(pushButton)
        
        pushButton.setTitle("Go to next page", for: .normal)
        pushButton.setTitleColor(.black, for: .normal)
        
        pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        //stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    }
    
    func setSegmentedControlLabelConstraints() {
        segmentedControlLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControlLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    func setSegmentedControlConstraints() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //segmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setVCConstraints() {
        vc.translatesAutoresizingMaskIntoConstraints = false
        //vc.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        vc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        vc.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 50).isActive = true
        vc.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        vc.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //vc.heightAnchor.constraint(equalToConstant: 500).isActive = true
        //vc.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func pushButtonTapped() {
        print("push button tapped")
        
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc func segmentedControlChanged(_ segmentedControl: UISegmentedControl) {
        //var vc: UIViewController?
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            //segmentedControlLabel.text = "Table View"
            //view.backgroundColor = .white
            //vc = staffTableListViewController!
            //selectedVC = staffTableListViewController.view
            //vc.addSubview(selectedVC!)
            //vc.addSubview(vc)
            //vc.addSubview(vc)
            //vc.removeFromSuperview()
            vc.bringSubviewToFront(staffTableListViewController!)
            //vc.addSubview(staffTableListViewController!)
        case 1:
            //segmentedControlLabel.text = "Collection View"
            //view.backgroundColor = .lightGray
            //vc = staffCollectionListViewController!
            //selectedVC = staffCollectionListViewController.view
            //vc.addSubview(selectedVC!)
            //vc.addSubview(vc)
            //vc.removeFromSuperview()
            vc.bringSubviewToFront(staffCollectionListViewController!)
            //vc.addSubview(staffCollectionListViewController!)
        default:
            segmentedControlLabel.text = "Default"
        }
    }

}
