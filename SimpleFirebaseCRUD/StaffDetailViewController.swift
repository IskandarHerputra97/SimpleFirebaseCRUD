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
    let networkingClient = NetworkingClient()
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let staffImageView = UIImageView()
    
    let nameTitleLabel = UILabel()
    let nameLabel = UILabel()
    
    let phoneNumberTitleLabel = UILabel()
    let phoneNumberLabel = UILabel()
    
    let emailTitleLabel = UILabel()
    let emailLabel = UILabel()
    
    let salaryTitleLabel = UILabel()
    let salaryLabel = UILabel()
    
    let ageTitleLabel = UILabel()
    let ageLabel = UILabel()
    
    let addressTitleLabel = UILabel()
    let addressLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        title = "Staff Detail"
        
        setupNavigationBarItem()
        
        setupStaffImageView()
        
        setupNameTitleLabel()
        setupNameLabel()
        
        setupPhoneNumberTitleLabel()
        setupPhoneNumberLabel()
        
        setupEmailTitleLabel()
        setupEmailLabel()
        
        setupSalaryTitleLabel()
        setupSalaryLabel()
        
        setupAgeTitleLabel()
        setupAgeLabel()
        
        setupAddressTitleLabel()
        setupAddressLabel()
        
        setupScrollView()
        setupStackView()
    }
    
    //MARK : - SETUP UI
    func setupNavigationBarItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editNavigationBarItemTapped))
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        setScrollViewConstraints()
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        //stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(staffImageView)
        stackView.addArrangedSubview(nameTitleLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(phoneNumberTitleLabel)
        stackView.addArrangedSubview(phoneNumberLabel)
        stackView.addArrangedSubview(emailTitleLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(salaryTitleLabel)
        stackView.addArrangedSubview(salaryLabel)
        stackView.addArrangedSubview(ageTitleLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.addArrangedSubview(addressTitleLabel)
        stackView.addArrangedSubview(addressLabel)
        
        setStackViewConstraints()
    }
    
    func setupStaffImageView() {
        staffImageView.translatesAutoresizingMaskIntoConstraints = false
        staffImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupNameTitleLabel() {
        nameTitleLabel.text = "NAME"
        nameTitleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        nameTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameTitleLabel.numberOfLines = 0
    }
    
    func setupNameLabel() {
        //nameLabel.text = "Name label"
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.numberOfLines = 0
    }
    
    func setupPhoneNumberTitleLabel() {
        phoneNumberTitleLabel.text = "PHONE NUMBER"
        phoneNumberTitleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        phoneNumberTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        phoneNumberTitleLabel.numberOfLines = 0
    }
    
    func setupPhoneNumberLabel() {
        //phoneNumberLabel.text = "Phone number label"
        phoneNumberLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        phoneNumberLabel.numberOfLines = 0
    }
    
    func setupEmailTitleLabel() {
        emailTitleLabel.text = "EMAIL"
        emailTitleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        emailTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        emailTitleLabel.numberOfLines = 0
    }
    
    func setupEmailLabel() {
        //emailLabel.text = "Email label"
        emailLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        emailLabel.numberOfLines = 0
    }
    
    func setupSalaryTitleLabel() {
        salaryTitleLabel.text = "SALARY"
        salaryTitleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        salaryTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        salaryTitleLabel.numberOfLines = 0
    }
    
    func setupSalaryLabel() {
        //salaryLabel.text = "Salary label"
        salaryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        salaryLabel.numberOfLines = 0
    }
    
    func setupAgeTitleLabel() {
        ageTitleLabel.text = "AGE"
        ageTitleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        ageTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ageTitleLabel.numberOfLines = 0
    }
    
    func setupAgeLabel() {
        //ageLabel.text = "Age label"
        ageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ageLabel.numberOfLines = 0
    }
    
    func setupAddressTitleLabel() {
        addressTitleLabel.text = "ADDRESS"
        addressTitleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        addressTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addressTitleLabel.numberOfLines = 0
    }
    
    func setupAddressLabel() {
        //addressLabel.text = "Address label"
        addressLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addressLabel.numberOfLines = 0
    }
    
    //MARK : - SET CONSTRAINTS
    func setScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    //MARK : - ACTIONS
    @objc func editNavigationBarItemTapped() {
        print("Edit")
        let editStaffViewController = EditStaffViewController()
        
        editStaffViewController.staffImageView.image = staffImageView.image
        editStaffViewController.nameTextField.placeholder = nameLabel.text
        //editStaffViewController.nameTextField.placeholder = networkingClient.test
        editStaffViewController.phoneNumberTextField.placeholder = phoneNumberLabel.text
        editStaffViewController.emailTextField.placeholder = phoneNumberLabel.text
        editStaffViewController.salaryTextField.placeholder = salaryLabel.text
        editStaffViewController.ageTextField.placeholder = ageLabel.text
        editStaffViewController.addressTextField.placeholder = addressLabel.text
        
        self.navigationController?.present(editStaffViewController, animated: true, completion: nil)
    }
}
