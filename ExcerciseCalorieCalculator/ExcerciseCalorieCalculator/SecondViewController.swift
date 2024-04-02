//
//  SecondViewController.swift
//  ExcerciseCalorieCalculator
//
//  Created by John Cagle on 01.04.24.
//

import UIKit
var userExerciseTime: Double?
var userHeartRate: Double?

class SecondViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseTime.delegate = self
        avgHeartRate.delegate = self
    }

    @IBOutlet weak var exerciseTime: UITextField!
    @IBOutlet weak var avgHeartRate: UITextField!

    @IBAction func saveExerciseInfo(_ sender: Any) {
        // This will validate the inputs for exerciseTime and avgHeartRate
        if let exerciseTimeValue = Double(exerciseTime.text!), let heartRateValue = Double(avgHeartRate.text!) {
            userExerciseTime = exerciseTimeValue
            userHeartRate = heartRateValue
            
            // This will advance to the next tab, if the next tab index is correct
            if let tabBarController = self.tabBarController {
                // This will adjust the selectedIndex properly for my tab order
                tabBarController.selectedIndex += 1
            }
        } else {
            // This will show an alert for bad inputs
            let alert = UIAlertController(title: "Invalid Input!", message: "Please enter proper numbers for exercise time and heart rate.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

