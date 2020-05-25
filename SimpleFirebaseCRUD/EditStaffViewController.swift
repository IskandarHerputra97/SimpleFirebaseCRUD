//
//  EditStaffViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 25/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class EditStaffViewController: UIViewController {

    //MARK: - PROPERTIES
    let stackView = UIStackView()
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let phoneNumberLabel = UILabel()
    let phoneNumberTextField = UITextField()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let salaryLabel = UILabel()
    let salaryTextField = UITextField()
    let ageLabel = UILabel()
    let ageTextField = UITextField()
    let addressLabel = UILabel()
    let addressTextField = UITextField()
    
    let stackView2 = UIStackView()
    let editButton = UIButton()
    let cancelButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        title = "Edit Staff Data"
        
        setupNameLabel()
        setupNameTextField()
        setupPhoneNumberLabel()
        setupPhoneNumberTextField()
        setupEmailLabel()
        setupEmailTextField()
        setupSalaryLabel()
        setupSalaryTextField()
        setupAgeLabel()
        setupAgeTextField()
        setupAddressLabel()
        setupAddressTextField()
        setupStackView()
        
        setupEditButton()
        setupCancelButton()
        setupStackView2()
    }
    
    //MARK : - SETUP UI
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        //stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(phoneNumberLabel)
        stackView.addArrangedSubview(phoneNumberTextField)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(salaryLabel)
        stackView.addArrangedSubview(salaryTextField)
        stackView.addArrangedSubview(ageLabel)
        stackView.addArrangedSubview(ageTextField)
        stackView.addArrangedSubview(addressLabel)
        stackView.addArrangedSubview(addressTextField)
        
        setStackViewConstraints()
    }
    
    func setupNameLabel() {
        nameLabel.text = "Name label"
    }
    
    func setupNameTextField() {
        view.addSubview(nameTextField)
        
        nameTextField.backgroundColor = .white
        nameTextField.borderStyle = .bezel
        
        setTextFieldConstraints(textField: nameTextField)
    }
    
    func setupPhoneNumberLabel() {
        phoneNumberLabel.text = "Phone number label"
    }
    
    func setupPhoneNumberTextField() {
        view.addSubview(phoneNumberTextField)
        
        phoneNumberTextField.backgroundColor = .white
        phoneNumberTextField.borderStyle = .bezel
        
        setTextFieldConstraints(textField: phoneNumberTextField)
    }
    
    func setupEmailLabel() {
        emailLabel.text = "Email label"
    }
    
    func setupEmailTextField() {
        view.addSubview(emailTextField)
        
        emailTextField.backgroundColor = .white
        emailTextField.borderStyle = .bezel
        
        setTextFieldConstraints(textField: emailTextField)
    }
    
    func setupSalaryLabel() {
        salaryLabel.text = "Salary label"
    }
    
    func setupSalaryTextField() {
        view.addSubview(salaryTextField)
        
        salaryTextField.backgroundColor = .white
        salaryTextField.borderStyle = .bezel
        
        setTextFieldConstraints(textField: salaryTextField)
    }
    
    func setupAgeLabel() {
        ageLabel.text = "Age label"
    }
    
    func setupAgeTextField() {
        view.addSubview(ageTextField)
        
        ageTextField.backgroundColor = .white
        ageTextField.borderStyle = .bezel
        
        setTextFieldConstraints(textField: ageTextField)
    }
    
    func setupAddressLabel() {
        addressLabel.text = "Address label"
    }
    
    func setupAddressTextField() {
        view.addSubview(addressTextField)
        
        addressTextField.backgroundColor = .white
        addressTextField.borderStyle = .bezel
        
        setTextFieldConstraints(textField: addressTextField)
    }
    
    func setupStackView2() {
        view.addSubview(stackView2)
        
        stackView2.axis = .horizontal
        stackView2.spacing = 20
        //stackView2.alignment = .center
        stackView2.distribution = .fillEqually
        
        stackView2.addArrangedSubview(editButton)
        stackView2.addArrangedSubview(cancelButton)
        
        setStackView2Constraints()
    }
    
    func setupEditButton() {
        editButton.setTitle("Edit", for: .normal)
        editButton.backgroundColor = .blue
        
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }
    
    func setupCancelButton() {
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = .red
        
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    //MARK : - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        //stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setTextFieldConstraints(textField name: UIView) {
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        name.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func setStackView2Constraints() {
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        stackView2.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20).isActive = true
        stackView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
    
    //MARK : - ACTIONS
    @objc func editButtonTapped() {
        print("Edit")
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
