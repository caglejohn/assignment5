//
//  ThirdViewController.swift
//  ExcerciseCalorieCalculator
//
//  Created by John Cagle on 01.04.24.
//

import UIKit

var caloriesBurned: Double?
class ThirdViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBOutlet weak var calories: UILabel!
    
    @IBAction func calcCalories(_ sender: Any) {
        switch userGender {
        case "Female":
           caloriesBurned = ((userAge!*0.074)-(userWeight!*0.05741)+(userHeartRate!*0.4472)-20.4022)*userExerciseTime!/4.184
        case "Male":
          caloriesBurned = ((userAge!*0.2017)-(userWeight!*0.09036)+(userHeartRate!*0.6309)-55.0969)*userExerciseTime!/4.184
        default:
            return
             }
        calories.text = "\(Int(caloriesBurned!)) calories burned!"
        
        // This presents an alert offering to go again
        let alert = UIAlertController(title: "Calculation Complete!", message: "You've burned \(Int(caloriesBurned!)) calories. Would you like to start over?", preferredStyle: .alert)
        
        // This will add an action to the alert that resets the app
        alert.addAction(UIAlertAction(title: "Go Again", style: .default, handler: { [weak self] _ in
            // The UITabBarController is root, select the first tab
            self?.tabBarController?.selectedIndex = 0
        }))
        
        // This adds a Cancel action to let the user to stay on the current screen
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // This presents the alert
        present(alert, animated: true, completion: nil)
    }

    /* For backup in case the added experimental functionality doesn't work:
     
     import UIKit

     var caloriesBurned: Double?
     class ThirdViewController: UIViewController {
      
         override func viewDidLoad() {
             super.viewDidLoad()
         }
         
         
         @IBOutlet weak var calories: UILabel!
         
         @IBAction func calcCalories(_ sender: Any) {
             
             switch userGender {
             case "Female":
                caloriesBurned = ((userAge!*0.074)-(userWeight!*0.05741)+(userHeartRate!*0.4472)-20.4022)*userExerciseTime!/4.184
             case "Male":
               caloriesBurned = ((userAge!*0.2017)-(userWeight!*0.09036)+(userHeartRate!*0.6309)-55.0969)*userExerciseTime!/4.184
             default:
                 return
                  }
                  calories.text = String(Int(caloriesBurned!)) +
                                           " calories burned!"

         }
         
     }
     
     */
    
    
}
