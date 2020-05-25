//
//  StaffDetailViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 25/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class StaffDetailViewController: UIViewController {
    
    //MARK: - PROPERTIES
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let phoneNumberLabel = UILabel()
    let emailLabel = UILabel()
    let salaryLabel = UILabel()
    let ageLabel = UILabel()
    let addressLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        title = "Staff Detail"
        
        setupNavigationBarItem()
        setupNameLabel()
        setupPhoneNumberLabel()
        setupEmailLabel()
        setupSalaryLabel()
        setupAgeLabel()
        setupAddressLabel()
        setupStackView()
    }
    
    //MARK : - SETUP UI
    func setupNavigationBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editNavigationBarItemTapped))
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        //stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(phoneNumberLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(salaryLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.addArrangedSubview(addressLabel)
        
        setStackViewConstraints()
    }
    
    func setupNameLabel() {
        //nameLabel.text = "Name label"
    }
    
    func setupPhoneNumberLabel() {
        //phoneNumberLabel.text = "Phone number label"
    }
    
    func setupEmailLabel() {
        //emailLabel.text = "Email label"
    }
    
    func setupSalaryLabel() {
        //salaryLabel.text = "Salary label"
    }
    
    func setupAgeLabel() {
        //ageLabel.text = "Age label"
    }
    
    func setupAddressLabel() {
        //addressLabel.text = "Address label"
    }
    
    //MARK : - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //MARK : - ACTIONS
    @objc func editNavigationBarItemTapped() {
        print("Edit")
        let editStaffViewController = EditStaffViewController()
        
        editStaffViewController.nameTextField.text = nameLabel.text
        editStaffViewController.phoneNumberTextField.text = phoneNumberLabel.text
        editStaffViewController.emailTextField.text = phoneNumberLabel.text
        editStaffViewController.salaryTextField.text = salaryLabel.text
        editStaffViewController.ageTextField.text = ageLabel.text
        editStaffViewController.addressTextField.text = addressLabel.text
        
        self.navigationController?.present(editStaffViewController, animated: true, completion: nil)
    }
}
