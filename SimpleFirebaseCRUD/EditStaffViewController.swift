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
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let staffImageView = UIImageView()
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
    let errorMessageLabel = UILabel()
    
    let stackView2 = UIStackView()
    let editButton = UIButton()
    let cancelButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        title = "Edit Staff Data"
        
        setupScrollView()
        
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
        setupErrorMessageLabel()
        
        setupEditButton()
        setupCancelButton()
        setupStackView2()
        
        setupStackView()
        
        
    }
    
    //MARK : - SETUP UI
    func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        setScrollViewConstraints()
    }
    
    func setupStackView() {
        //view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        //stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(staffImageView)
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
        stackView.addArrangedSubview(errorMessageLabel)
        stackView.addArrangedSubview(stackView2)
        
        setStackViewConstraints()
    }
    
    func setupStaffImageView() {
        //staffImageView.translatesAutoresizingMaskIntoConstraints = false
        //staffImageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 75).isActive = true
        //staffImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
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
        salaryLabel.text = "Salary label ($1 - $1000)"
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
    
    func setupErrorMessageLabel() {
        errorMessageLabel.isHidden = true
        
        errorMessageLabel.text = "Please change at least one staff data"
        errorMessageLabel.numberOfLines = 2
        errorMessageLabel.textColor = .red
        errorMessageLabel.textAlignment = .center
    }
    
    func setupStackView2() {
        view.addSubview(stackView2)
        
        stackView2.axis = .horizontal
        stackView2.spacing = 20
        //stackView2.alignment = .center
        stackView2.distribution = .fillEqually
        
        stackView2.addArrangedSubview(editButton)
        stackView2.addArrangedSubview(cancelButton)
        
        //setStackView2Constraints()
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
    func setScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        //stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
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
    func checkIfTextFieldValueChanged() -> Bool {
        if nameTextField.text == "" && phoneNumberTextField.text == "" && emailTextField.text == "" && salaryTextField.text == "" && ageTextField.text == "" && addressTextField.text == "" {
            return false
        } else {
            return true
        }
    }
    
    @objc func editButtonTapped() {
        let textFieldChanged = checkIfTextFieldValueChanged()
        if textFieldChanged {
            let salary = Int(salaryTextField.text!)!
            print("\(salary)")
            if salary < 1 || salary > 1000 {
                errorMessageLabel.text = "Salary must be between $1 to $1000"
                errorMessageLabel.isHidden = false
            } else {
                errorMessageLabel.isHidden = true
                print("Edit")
                dismiss(animated: true, completion: nil)
            }
        } else {
            errorMessageLabel.isHidden = false
            print("all text field empty")
        }
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
