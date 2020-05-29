//
//  AddStaffViewController.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 17/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit
import MapKit

class AddStaffViewController: UIViewController {
    //MARK: - Properties
    let networkingClient = NetworkingClient()
    
    let scrollView = UIScrollView()
    
    let stackView = UIStackView()
    let stackView2 = UIStackView()
    
    let addStaffLabel = UILabel()
    let staffImageView = UIImageView()
    var imagePickerController = UIImagePickerController()
    let takePictureFromCameraButton = UIButton()
    let takePictureFromGalleryButton = UIButton()
    
    let staffPhotoLabel = UILabel()
    
    let staffNameLabel = UILabel()
    let randomNameButton = UIButton()
    let staffNameTextField = UITextField()
    
    let staffPhoneNumberLabel = UILabel()
    let staffPhoneNumberTextField = UITextField()
    
    let staffEmailLabel = UILabel()
    let staffEmailTextField = UITextField()
    
    let staffSalaryLabel = UILabel()
    let staffSalaryValueLabel = UILabel()
    let staffSalarySlider = UISlider()
    
    let staffAgeLabel = UILabel()
    var staffAgeValueTextField = UITextField()
    //var staffAgeValueTextField: UITextField!
    let agePicker = UIPickerView()
    let toolBar = UIToolbar()
    //var ageArray = Array(20...50)
    let ageArray = ["20", "30", "40", "50"]
    var selectedAge: String?
    
    let staffAddressLabel = UILabel()
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    let appleMaps = MKMapView()
    let mapPinImage = UIImageView()
    let staffLocationLabel = UILabel()
    var previousLocation: CLLocation?
    
    let addStaffButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        //title = "Add Staff"
        
        checkLocationServices()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        //setupToolBar()
        
        setupAddStaffLabel()
        
        setupStaffPhotoLabel()
        setupStaffImageView()
        setuptakePictureFromCameraButton()
        setuptakePictureFromGalleryButton()
        
        setupStaffNameLabel()
        setupRandomNameButton()
        setupStaffNameTextField()
        
        setupStaffPhoneNumberLabel()
        setupStaffPhoneNumberTextField()
        
        setupStaffEmailLabel()
        setupStaffEmailTextField()
        
        setupStaffSalaryLabel()
        setupStaffSalaryValueLabel()
        setupStaffSalarySlider()
        
        setupStaffAgeLabel()
        //setupAgePicker()
        setupStaffAgeValueTextField()
        setupAgePickerView()
        //setupToolBar()
        
        
        setupStaffAddressLabel()
        setupAppleMaps()
        setupMapPinImage()
        setupStaffLocationLabel()
        
        setupAddStaffButton()
        
        setupScrollView()
        
        setupStackView()
        setupStackView2()
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
        stackView.spacing = 20
        stackView.alignment = .center
        
        stackView.addArrangedSubview(addStaffLabel)
        
        stackView.addArrangedSubview(staffPhotoLabel)
        stackView.addArrangedSubview(staffImageView)
        stackView.addArrangedSubview(stackView2)
        
        stackView.addArrangedSubview(staffNameLabel)
        stackView.addArrangedSubview(randomNameButton)
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
        
        stackView.addArrangedSubview(staffAddressLabel)
        stackView.addArrangedSubview(appleMaps)
        stackView.addArrangedSubview(mapPinImage)
        stackView.addArrangedSubview(staffLocationLabel)
        
        stackView.addArrangedSubview(addStaffButton)
        
        setStackViewConstraints()
    }
    
    func setupStackView2() {
        stackView2.axis = .horizontal
        //stackView2.alignment = .fill
        stackView2.spacing = 50
        stackView2.distribution = .fillEqually
        
        stackView2.addArrangedSubview(takePictureFromCameraButton)
        stackView2.addArrangedSubview(takePictureFromGalleryButton)
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
    
    func setupStaffImageView() {
        view.addSubview(staffImageView)
        
        staffImageView.image = UIImage(named: "warren-buffet")
        staffImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        staffImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        staffImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setuptakePictureFromCameraButton() {
        takePictureFromCameraButton.setTitle("Camera", for: .normal)
        takePictureFromCameraButton.backgroundColor = .red
        
        takePictureFromCameraButton.addTarget(self, action: #selector(takePictureFromCameraButtonTapped), for: .touchUpInside)
        //takePictureFromCameraButton.addTarget(self, action: #selector(showImagePickerControllers), for: .touchUpInside)
    }
    
    func setuptakePictureFromGalleryButton() {
        takePictureFromGalleryButton.setTitle("Gallery", for: .normal)
        takePictureFromGalleryButton.backgroundColor = .blue
        
        takePictureFromGalleryButton.addTarget(self, action: #selector(takePictureFromGalleryButtonTapped), for: .touchUpInside)
        //takePictureFromGalleryButton.addTarget(self, action: #selector(showImagePickerController), for: .touchUpInside)
    }
    
    func setupStaffNameLabel() {
        //view.addSubview(staffNameLabel)
        
        staffNameLabel.text = "Input staff name"
    }
    
    func setupRandomNameButton () {
        randomNameButton.setTitle("Use random name", for: .normal)
        randomNameButton.setTitleColor(.black, for: .normal)
        randomNameButton.setTitleColor(.red, for: .highlighted)
        randomNameButton.backgroundColor = .orange
        
        randomNameButton.addTarget(self, action: #selector(randomNameButtonTapped), for: .touchUpInside)
    }
    
    func setupStaffNameTextField() {
        //view.addSubview(staffNameTextField)
        view.addSubview(staffNameTextField)
        
        staffNameTextField.backgroundColor = .white
        staffNameTextField.borderStyle = .bezel
        
        setTextFieldConstraints(textField: staffNameTextField)
    }
    
    func setupStaffPhoneNumberLabel() {
        //view.addSubview(staffPhoneNumberLabel)
        
        staffPhoneNumberLabel.text = "Input staff phone number"
    }
    
    func setupStaffPhoneNumberTextField() {
        view.addSubview(staffPhoneNumberTextField)
        
        staffPhoneNumberTextField.backgroundColor = .white
        staffPhoneNumberTextField.borderStyle = .bezel
        staffPhoneNumberTextField.keyboardType = .numberPad
        
        setTextFieldConstraints(textField: staffPhoneNumberTextField)
    }
    
    func setupStaffEmailLabel() {
        //view.addSubview(staffEmailLabel
        
        staffEmailLabel.text = "Input staff email"
    }
    
    func setupStaffEmailTextField() {
        view.addSubview(staffEmailTextField)
        
        staffEmailTextField.backgroundColor = .white
        staffEmailTextField.borderStyle = .bezel
        
        setTextFieldConstraints(textField: staffEmailTextField)
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
        view.addSubview(staffSalarySlider)
        
        staffSalarySlider.tintColor = .red
        staffSalarySlider.thumbTintColor = .green
        staffSalarySlider.value = 500
        staffSalarySlider.minimumValue = 1
        staffSalarySlider.maximumValue = 1000
        
        staffSalarySlider.addTarget(self, action: #selector(slider(sender:)), for: .valueChanged)
        
        staffSalarySlider.translatesAutoresizingMaskIntoConstraints = false
        staffSalarySlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        staffSalarySlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupStaffAgeLabel() {
        //view.addSubview(staffAgeLabel)
        
        staffAgeLabel.text = "Input staff age"
    }
    
    func setupStaffAgeValueTextField() {
        view.addSubview(staffAgeValueTextField)
        
        //staffAgeValueTextField.inputView = agePicker
        staffAgeValueTextField.backgroundColor = .white
        staffAgeValueTextField.borderStyle = .bezel
        
        
        setTextFieldConstraints(textField: staffAgeValueTextField)
    }
    
    func setupToolBar() {
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        staffAgeValueTextField.inputAccessoryView = toolBar
    }
    
    func setupAgePicker() {
        view.addSubview(agePicker)
        
        agePicker.delegate = self
        agePicker.dataSource = self
        
        //staffAgeValueTextField.inputView = agePicker
    }
    
    func setupStaffAddressLabel() {
        //view.addSubview(staffAddressLabel)
        
        staffAddressLabel.text = "Input staff address"
    }
    
    func setupAppleMaps() {
        view.addSubview(appleMaps)
        
        appleMaps.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        appleMaps.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        appleMaps.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupMapPinImage() {
        mapPinImage.image = UIImage(named: "mapPin2")
    }
    
    func setupStaffLocationLabel() {
        staffLocationLabel.text = "Location label here"
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
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
    
    func setStackView2Constraints() {
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    /*
    func setAddStaffLabelConstraints() {
        addStaffLabel.translatesAutoresizingMaskIntoConstraints = false
        addStaffLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addStaffLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    */
    
    func setTextFieldConstraints(textField name: UIView) {
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        name.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
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
    
    @objc func randomNameButtonTapped() {
        print("random name button tapped")
        
        networkingClient.fetchDataWithAlamofire { (result) in
            self.staffNameTextField.text = result
        }
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            appleMaps.setRegion(region, animated: true)
        }
    }
    
    func startTrackingUserLocation() {
        appleMaps.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        getCenterLocation(for: appleMaps)
    }
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse://App authorized to get user location when open
            startTrackingUserLocation()
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            appleMaps.showsUserLocation = true
        case .restricted:
            break
        case .authorizedAlways://App always authorized to get user location, open or in the background
            break
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkAuthorizationStatus()
        } else {
            //show alert letting the user know they have to turn this on.
        }
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}

extension AddStaffViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func setupAgePickerView() {
        let agePickerView = UIPickerView()
        agePickerView.delegate = self
        
        staffAgeValueTextField.inputView = agePickerView
    }
    
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
        
        staffAgeValueTextField.resignFirstResponder()
    }
}

extension AddStaffViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @objc func setupImagePickerControllerFromGallery(completion: @escaping () -> ()) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            print("Image controller from saved photo album")
            
            imagePickerController.delegate = self
            imagePickerController.sourceType = .savedPhotosAlbum
            imagePickerController.allowsEditing = false
            
            present(imagePickerController, animated: true, completion: nil)
            
            //completion()
        }
    }
    
    @objc func setupImagePickerControllerFromCamera(completion: @escaping () -> ()) {
        if UIImagePickerController.isCameraDeviceAvailable(.rear) {
            print("Image controller from rear camera")
            
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            imagePickerController.allowsEditing = false
            
            present(imagePickerController, animated: true, completion: nil)
            
            //completion()
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        self.dismiss(animated: true, completion: { () -> Void in
            //self.staffImageView.image = image
            
            
        })
        staffImageView.image = image
        
    }
    
    @objc func takePictureFromCameraButtonTapped() {
        print("taking image from camera")
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func takePictureFromGalleryButtonTapped() {
        print("taking image from gallery")
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            staffImageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            staffImageView.image = originalImage
        }
        
        dismiss(animated: true, completion: nil )
    }
    
}

extension AddStaffViewController: CLLocationManagerDelegate {
    /*
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        appleMaps.setRegion(region, animated: true)
    }
    */
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorizationStatus()
    }
}

extension AddStaffViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        guard let previousLocation = self.previousLocation else {return}
        
        guard center.distance(from: previousLocation) > 50 else {return}
        self.previousLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else {return}
            
            if let _ = error {
                //TODO: show alert informing the user
                return
            }
            
            guard let placemark = placemarks?.first else{
                //TODO: show alert informing the user
                return
            }
            
            let streetName = placemark.subThoroughfare ?? ""
            let streetNumber = placemark.thoroughfare ?? ""
            
            DispatchQueue.main.async {
                self.staffAddressLabel.text = "\(streetName) \(streetNumber)"
            }
        }
    }
}
