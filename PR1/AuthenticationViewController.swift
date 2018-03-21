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
            print("authorizationAllowed == true")
            performSegue(withIdentifier: "SegueToMainNavigation", sender: self)
        }else{
            print("authorizationAllowd == false")
            Utils.show(Message: "Sorry, the entered code is not valid", WithTitle: "Error", InViewController: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTextFields()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let count = (textField.text?.count) ?? 0
        let rangeCount = range.length
        print("current text: \(String(describing: textField.text))")
        print("replacement text: \(string)")
        print("count \(count)")
        print("range \(rangeCount)")
        print("string \(string.count)")
        let result = count+string.count-rangeCount
        print("newLength: \(result)")
        if result <= 1 {
            return true
        }else{
            return false
        }
    }
    
    func initTextFields(){
        print("initTextFields")
        firstField.delegate = self
        secondField.delegate = self
        thirdField.delegate = self
        fourthField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // END-UOC-4
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    } 
}
