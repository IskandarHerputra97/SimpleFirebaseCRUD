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
    let stackView = UIStackView()
    var segmentedControlLabel = UILabel()
    //let segmentedItems = ["Table View", "Collection View"]
    let items = ["Table View", "Collection View"]
    var segmentedControl = UISegmentedControl()
    let searchBarLabel = UILabel()
    let tableViewLabel = UILabel()
    let collectionViewLabel = UILabel()
    
    let pushButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupSegmentedControlLabel()
        setupSegmentedControl()
        setupSearchBarLabel()
        setupTableViewLabel()
        setupCollectionViewLabel()
        
        setupPushButton()
        
        setupStackView()
    }
    
    //MARK: - SETUP UI
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        
        stackView.addArrangedSubview(segmentedControlLabel)
        stackView.addArrangedSubview(segmentedControl)
        stackView.addArrangedSubview(searchBarLabel)
        stackView.addArrangedSubview(tableViewLabel)
        stackView.addArrangedSubview(collectionViewLabel)
        
        stackView.addArrangedSubview(pushButton)
        
        setStackViewConstraints()
    }
    
    func setupSegmentedControlLabel() {
        view.addSubview(segmentedControlLabel)
        
        segmentedControlLabel.text = "Segmented control here"
    }
    
    func setupSegmentedControl() {
        view.addSubview(segmentedControl)
        //let items = ["Table View", "Collection View"]
        //let segmentedControls = UISegmentedControl(items: items)
        
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
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
        
        pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func pushButtonTapped() {
        print("push button tapped")
        
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc func segmentedControlChanged(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            //segmentedControlLabel.text = "Table View"
            view.backgroundColor = .white
        case 1:
            //segmentedControlLabel.text = "Collection View"
            view.backgroundColor = .lightGray
        default:
            segmentedControlLabel.text = "Default"
        }
    }

}
