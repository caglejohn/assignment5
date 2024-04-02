//
//  FirstViewController.swift
//  ExcerciseCalorieCalculator
//
//  Created by John Cagle on 01.04.24.
//

import UIKit
var userAge: Double?
var userWeight: Double?
var userGender: String = "Female"


class FirstViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        yourWeight.delegate = self
        yourAge.delegate = self
    }

    @IBOutlet weak var yourAge: UITextField!
    
    
    
    @IBOutlet weak var yourWeight: UITextField!

    @IBOutlet weak var genderButton: UISegmentedControl!
    
    @IBAction func genderButton(_ sender: Any) {
        
        switch genderButton.selectedSegmentIndex {
        case 0:
          userGender = "Female"
        case 1:
          userGender = "Male"
        default:
           return
               }

    }
    
    @IBAction func savePersonalInfo(_ sender: Any) {
        if let weight = Double(yourWeight.text!), let age = Double(yourAge.text!) {
            userWeight = weight
            userAge = age
            
            // This will check if the view controller is inside a UITabBarController
            if let tabBarController = self.tabBarController {
                // This will set the selectedIndex to the index of the tab I want to switch to
                // since SecondViewController is the second tab, the index is 1
                tabBarController.selectedIndex = 1
            }
        } else {
            // If the conversion fails or the input is nil, this will show an alert to the user
            let alert = UIAlertController(title: "Invalid Input!", message: "Please enter proper numbers for age and weight.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.yourWeight.resignFirstResponder()
        self.yourAge.resignFirstResponder()
        return true
    }

}
