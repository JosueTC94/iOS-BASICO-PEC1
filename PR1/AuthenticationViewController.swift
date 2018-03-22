//
//  AuthenticationViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    // BEGIN-UOC-4
    // Outlets
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var fourthField: UITextField!
    
    // Función nextButton ==> Concatenamos valores individuales de los campos de texto y validamos el código
    @IBAction func nextButton(_ sender: UIButton) {
        print("nextButton pressed")
        print("firstField: \(firstField.text!)")
        print("secondField: \(secondField.text!)")
        print("thirdField: \(thirdField.text!)")
        print("fourthField: \(fourthField.text!)")
        
        let code = "\(firstField.text!)\(secondField.text!)\(thirdField.text!)\(fourthField.text!)"
        
        let authorizationAllowed = Services.validate(code: code)
        if authorizationAllowed{
            // Autorización permitida => true
            performSegue(withIdentifier: "SegueToMainNavigation", sender: self)
        }else{
            // Autorización permitida => false
            Utils.show(Message: "Sorry, the entered code is not valid", WithTitle: "Error", InViewController: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstField.delegate = self
        secondField.delegate = self
        thirdField.delegate = self
        fourthField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        print("text:\(String((textField.text?.count)!)), string:\(string.count), range: \(String(range.length))")
        if (textField.text?.count)! + string.count - range.length <= 1 {
            return true
        }else{
            return false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // END-UOC-4
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    } 
}
