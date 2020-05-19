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
    let segmentedControlLabel = UILabel()
    let searchBarLabel = UILabel()
    let tableViewLabel = UILabel()
    let collectionViewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        setupSegmentedControlLabel()
        setupSearchBarLabel()
        setupTableViewLabel()
        setupCollectionViewLabel()
        setupStackView()
    }
    
    //MARK: - SETUP UI
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.addArrangedSubview(segmentedControlLabel)
        stackView.addArrangedSubview(searchBarLabel)
        stackView.addArrangedSubview(tableViewLabel)
        stackView.addArrangedSubview(collectionViewLabel)
        
        setStackViewConstraints()
    }
    
    func setupSegmentedControlLabel() {
        view.addSubview(segmentedControlLabel)
        
        segmentedControlLabel.text = "Segmented control here"
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
    
    //MARK: - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
