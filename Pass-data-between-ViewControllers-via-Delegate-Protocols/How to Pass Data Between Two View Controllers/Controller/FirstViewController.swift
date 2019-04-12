//
//  ViewController.swift
//  How to Pass Data Between Two View Controllers
//
//  Created by Ilija Mihajlovic on 9/10/17.
//  Copyright © 2017 Ilija Mihajlovic. All rights reserved.
//

import UIKit

//Delegate Class
class FirstViewController: UIViewController, UITextFieldDelegate, CanReceive {
    
    //MARK: - Properties
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.returnKeyType = .done
    }
   
    //Dismiss the keyboard by tapping the done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        if (textField.text?.count)! > 0 {
            performSegue(withIdentifier: "sendDataToSecondVC", sender: self)
            textField.text  = ""
            
        } else {
            showAlert(title: "Invalid Input", message: "Please Enter Text in Text Field", actions: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Check if this is the right segue identifier
        if segue.identifier == "sendDataToSecondVC" {
            
            //Get a refrence to the destination ViewController
            let secondVC = segue.destination as! SecondViewController
            secondVC.dataForSending = textField.text!
            secondVC.delegate = self
        }
        
    }
    
    //Implement the required delegate method
    func dataReceive(data: String) {
        label.text = data
    }
    
}

