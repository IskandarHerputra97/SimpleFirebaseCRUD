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
    let layout = UICollectionViewFlowLayout()
    //var collectionView = UICollectionView()
    //layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    //layout.itemSize = CGSize(width: view.frame.width, height: 700)
    //var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    
    let testText = UILabel()
    let textView = UITextView()
    let fetchButton = UIButton()
    
    //let containerView = UIView()
    
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
        
        //setupCollectionView()
        
        //setupContainerView()
    }
    
    //MARK: - SETUP UI
    /*
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 700)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        /*
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionView.frame = .zero
        collectionView.collectionViewLayout = layout
        */
 
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(StaffCollectionViewCell.self, forCellWithReuseIdentifier: "StaffCollectionViewCell")
        
        //setCollectionViewConstraints()
    }
    */
    
    /*
    func setupContainerView() {
        containerView.addSubview(testText)
    }
    */
    
    func setupTestText() {
        view.addSubview(testText)
        
        testText.backgroundColor = .brown
        testText.text = "Collection view page here"
        testText.numberOfLines = 0
        
        //setTestTextConstraints()
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
    /*
    func setCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    */
    
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

extension StaffCollectionListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("Collection view item tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = UICollectionViewCell()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StaffCollectionViewCell", for: indexPath) as! StaffCollectionViewCell
        cell.set(image: UIImage(named: "animal-cat")!)
        
        //cell.contentView = containerView
        
        return cell
    }
    
    
}
