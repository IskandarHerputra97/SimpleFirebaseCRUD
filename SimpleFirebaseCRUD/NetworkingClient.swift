//
//  NetworkingClient.swift
//  SimpleFirebaseCRUD
//
//  Created by Iskandar Herputra Wahidiyat on 11/05/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import Foundation
import Alamofire
import Firebase

class NetworkingClient {
    
    var test = "Test name"
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    
    func execute(_ url: URL, completion: @escaping WebServiceResponse) {
        Alamofire.request(url).validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.result.value as? [[String: Any]] {
                completion(jsonArray, nil)
            } else if let jsonDict = response.result.value as? [String: Any] {
                completion([jsonDict], nil)
            }
        }
    }
    
    func fetchDataWithAlamofire(completion: @escaping (_ result: String) -> ()) {
        Alamofire.request("https://api.namefake.com", method: .get).responseJSON { (response) in
            //check if result has value
            if let JSON = response.result.value as? [String: Any] {
                print(JSON["name"] as! String)
                let myResult = JSON["name"] as! String
                completion(myResult)
            }
        }
    }
    
    //Firebase Cloud Firestore
    let dummyStaff = ["Colonel Sanders", "Ronald McDonald", "Burger King"]
    var staffData = [Staff]()
    
    func getStaffData(completion: @escaping () -> ()) {
        let db = Firestore.firestore()
        
        db.collection("staff").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    let documentData = document.data()
                    
                    let name = documentData["name"] as? String ?? ""
                    let phoneNumber = documentData["phoneNumber"] as? String ?? ""
                    let email = documentData["email"] as? String ?? ""
                    let salary = documentData["salary"] as? Int ?? 0
                    let age = documentData["age"] as? Int ?? 0
                    let address = documentData["address"] as? String ?? ""
                    
                    let newStaff = Staff(name: name, phoneNumber: phoneNumber, email: email, salary: salary, age: age, address: address)
                    
                    self.staffData.append(newStaff)
                    
                    //DispatchQueue.main.async {
                        //StaffTableListViewController().tableView.reloadData()
                        completion()
                    //}
                }
            }
        }
    }
    
    func updateStaffData() {}
    
    //Firebase storage
    var staffImageData = [UIImage?]()
    
    func getStaffImage(completion: @escaping () -> ()) {
        //Buat reference untuk firebase storage
        let storage = Storage.storage().reference()
        
        var staffRef = storage.child("images/Random people 1.jpeg")
        
        staffRef.getData(maxSize: 4 * 1024 * 1024) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Success!")
                let staffImage = UIImage(data: data!)
                self.staffImageData.append(staffImage!)
                //print("staff image = \(self.staffImageData)")
                completion()
            }
        }
    }
}
