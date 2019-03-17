//
//  SecondViewController.swift
//  How to Pass Data Between Two View Controllers
//
//  Created by Ilija Mihajlovic on 9/10/17.
//  Copyright © 2017 Ilija Mihajlovic. All rights reserved.
//

import UIKit

//Define the protocol
protocol CanReceive {
    func dataReceive(data: String)
}
//Delegator Class
class SecondViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    var dataForSending = ""
    var delegate: CanReceive?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = dataForSending
        textField.delegate = self
        textField.returnKeyType = .done
    }
    
    //Dismiss the keyboard by tapping the done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    
    //Dismiss the keyboard by tapping the done button
    @IBAction func sendDataBackToFirstVC(_ sender: UIButton) {
        if (textField.text?.characters.count)! > 0 {
            delegate?.dataReceive(data: textField.text!)
            dismiss(animated: true, completion: nil)
            textField.text = ""
        
        } else {
            showAlert(title: "Invalid Input", message: "Please Enter Text in Text Field", actions: nil)
        }
        
        
    }
    

}
