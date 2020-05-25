//
//  StaffCollectionListViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 20/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class StaffCollectionListViewController: UIViewController {

    //MARK: - PROPERTIES
    let testText = UILabel()
    let textView = UITextView()
    let fetchButton = UIButton()
    
    let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View did load from StaffCollectionListViewController")
        view.backgroundColor = .blue
        title = "Staff Collection View"
        
        setupTestText()
        setupFetchButton()
        
        fetchStaffData()
    }
    
    //MARK: - SETUP UI
    func setupTestText() {
        view.addSubview(testText)
        
        testText.backgroundColor = .brown
        testText.text = "Collection view page here"
        testText.numberOfLines = 0
        
        setTestTextConstraints()
    }
    
    func setupTextView() {
        view.addSubview(textView)
        
        setTextViewConstraints()
    }
    
    func setupFetchButton() {
        view.addSubview(fetchButton)
        
        fetchButton.setTitle("Fetch from staffcollection", for: .normal)
        
        fetchButton.addTarget(self, action: #selector(fetchButtonTapped(_:)), for: .touchUpInside)
        
        setFetchButtonConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setTestTextConstraints() {
        testText.translatesAutoresizingMaskIntoConstraints = false
        testText.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    }
    
    func setTextViewConstraints() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: testText.bottomAnchor, constant: 20).isActive = true
    }
    
    func setFetchButtonConstraints() {
        fetchButton.translatesAutoresizingMaskIntoConstraints = false
        fetchButton.topAnchor.constraint(equalTo: testText.bottomAnchor, constant: 20).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func fetchButtonTapped(_ sender: UIButton!) {
        print("fetch button tapped - collectionviewlist")
        testText.text = "Changed from outside of closure"
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts/3") else {
            return
        }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.testText.text = json.description
            }
        }
    }
    
    func fetchStaffData() {
        print("fetchStaffData for collection view")
        testText.text = "Changed from outside of closure"
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts/3") else {
            return
        }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.testText.text = json.description
            }
        }
    }
}
