//
//  AddStaffViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 17/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class AddStaffViewController: UIViewController {
    //MARK: - Properties
    let scrollView = UIScrollView()
    
    let stackView = UIStackView()
    
    let addStaffLabel = UILabel()
    
    let staffPhotoLabel = UILabel()
    
    let staffNameLabel = UILabel()
    let staffNameTextField = UITextField()
    
    let staffPhoneNumberLabel = UILabel()
    let staffPhoneNumberTextField = UITextField()
    
    let staffEmailLabel = UILabel()
    let staffEmailTextField = UITextField()
    
    let staffSalaryLabel = UILabel()
    let staffSalaryValueLabel = UILabel()
    let staffSalarySlider = UISlider()
    
    let staffAgeLabel = UILabel()
    let staffAgeValueTextField = UITextField()
    let toolBar = UIToolbar()
    let agePicker = UIPickerView()
    //var ageArray = Array(20...50)
    let ageArray = ["20", "30", "40"]
    var selectedAge: String?
    
    let staffAddressLabel = UILabel()
    
    let addStaffButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        //title = "Add Staff"
        setupAddStaffLabel()
        setupStaffPhotoLabel()
        setupStaffNameLabel()
        setupStaffNameTextField()
        setupStaffPhoneNumberLabel()
        setupStaffPhoneNumberTextField()
        setupStaffEmailLabel()
        setupStaffEmailTextField()
        setupStaffSalaryLabel()
        setupStaffSalaryValueLabel()
        setupStaffSalarySlider()
        setupStaffAgeLabel()
        setupAgeValue()
        setupToolBar()
        setupAgePicker()
        setupStaffAddressLabel()
        setupAddStaffButton()
        
        setupScrollView()
        
        setupStackView()
    }
    
    //MARK: - SETUP UI
    func setupScrollView() {
        view.addSubview(scrollView)
        
        setScrollViewConstraints()
        
        scrollView.addSubview(stackView)
    }
    
    func setupStackView() {
        //view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.addArrangedSubview(addStaffLabel)
        stackView.addArrangedSubview(staffPhotoLabel)
        stackView.addArrangedSubview(staffNameLabel)
        stackView.addArrangedSubview(staffNameTextField)
        stackView.addArrangedSubview(staffPhoneNumberLabel)
        stackView.addArrangedSubview(staffPhoneNumberTextField)
        stackView.addArrangedSubview(staffEmailLabel)
        stackView.addArrangedSubview(staffEmailTextField)
        stackView.addArrangedSubview(staffSalaryLabel)
        stackView.addArrangedSubview(staffSalaryValueLabel)
        stackView.addArrangedSubview(staffSalarySlider)
        stackView.addArrangedSubview(staffAgeLabel)
        stackView.addArrangedSubview(staffAgeValueTextField)
        stackView.addArrangedSubview(toolBar)
        stackView.addArrangedSubview(agePicker)
        stackView.addArrangedSubview(staffAddressLabel)
        stackView.addArrangedSubview(addStaffButton)
        
        setStackViewConstraints()
    }
    
    func setupAddStaffLabel() {
        //view.addSubview(addStaffLabel)
        
        addStaffLabel.textAlignment = .center
        addStaffLabel.text = "Add Staff Page"
    }
    
    func setupStaffPhotoLabel() {
        //view.addSubview(staffPhotoLabel)
        
        staffPhotoLabel.text = "Upload staff photo here"
    }
    
    func setupStaffNameLabel() {
        //view.addSubview(staffNameLabel)
        
        staffNameLabel.text = "Input staff name"
    }
    
    func setupStaffNameTextField() {
        //view.addSubview(staffNameTextField)
        
        staffNameTextField.backgroundColor = .white
        staffNameTextField.borderStyle = .bezel
    }
    
    func setupStaffPhoneNumberLabel() {
        //view.addSubview(staffPhoneNumberLabel)
        
        staffPhoneNumberLabel.text = "Input staff phone number"
    }
    
    func setupStaffPhoneNumberTextField() {
        //view.addSubview(staffPhoneNumberTextField)
        
        staffPhoneNumberTextField.backgroundColor = .white
        staffPhoneNumberTextField.borderStyle = .bezel
    }
    
    func setupStaffEmailLabel() {
        //view.addSubview(staffEmailLabel
        
        staffEmailLabel.text = "Input staff email"
    }
    
    func setupStaffEmailTextField() {
        //view.addSubview(staffEmailTextField)
        
        staffEmailTextField.backgroundColor = .white
        staffEmailTextField.borderStyle = .bezel
    }
    
    func setupStaffSalaryLabel() {
        //view.addSubview(staffSalaryLabel)
        
        staffSalaryLabel.text = "Input monthly staff salary"
    }
    
    func setupStaffSalaryValueLabel() {
        staffSalaryValueLabel.text = "0"
        staffSalaryValueLabel.textAlignment = .center
    }
    
    func setupStaffSalarySlider() {
        staffSalarySlider.tintColor = .red
        staffSalarySlider.thumbTintColor = .green
        staffSalarySlider.value = 500
        staffSalarySlider.minimumValue = 1
        staffSalarySlider.maximumValue = 1000
        
        staffSalarySlider.addTarget(self, action: #selector(slider(sender:)), for: .valueChanged)
    }
    
    func setupStaffAgeLabel() {
        //view.addSubview(staffAgeLabel)
        
        staffAgeLabel.text = "Input staff age"
    }
    
    func setupAgeValue() {}
    
    func setupToolBar() {
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        staffAgeValueTextField.inputAccessoryView = toolBar
    }
    
    func setupAgePicker() {
        agePicker.delegate = self
        
        staffAgeValueTextField.inputView = agePicker
    }
    
    func setupStaffAddressLabel() {
        //view.addSubview(staffAddressLabel)
        
        staffAddressLabel.text = "Input staff address"
    }
    
    func setupAddStaffButton() {
        //view.addSubview(addStaffButton)
        addStaffButton.setTitle("Add Staff", for: .normal)
        addStaffButton.setTitleColor(.red, for: .normal)
        
        addStaffButton.addTarget(self, action: #selector(addStaffButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - SET CONSTRAINTS
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
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func setAddStaffLabelConstraints() {
        addStaffLabel.translatesAutoresizingMaskIntoConstraints = false
        addStaffLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addStaffLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func addStaffButtonTapped(sender: UIButton!) {
        print("Add staff button tapped")
    }
    
    @objc func slider(sender: UISlider) {
        print(sender.value)
        staffSalaryValueLabel.text = "$ \(String(Int(sender.value)))"
    }
    
    @objc func dismissKeyboard() {
        print("dismissKeyboard tapped")
        view.endEditing(true)
    }
}

extension AddStaffViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ageArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAge = ageArray[row]
        
        staffAgeValueTextField.text = selectedAge
    }
}
