//
//  LoginViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //Created a string 
    var username: String = ""
    var password: String = ""
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!

    // BEGIN-UOC-2
    @IBAction func loginTapped(_ sender: UIButton) {
        username = usernameField.text!
        password = passwordField.text!
        print("Username: \(username), password: \(password)")
        let loginAllowed = Services.validate(username: username, password: password)
        print("loginAllowed: \(loginAllowed)")
        if loginAllowed == true {
            performSegue(withIdentifier: "SegueToAuthentication", sender: self)
        }else{
            Utils.show(Message: "Sorry, the username and password are invalid", WithTitle: "Title", InViewController: self)
        }
        
    }
    // END-UOC-2
    
    // BEGIN-UOC-5
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        usernameField.text = ""
        passwordField.text = ""
    }
    // END-UOC-5
    
    // BEGIN-UOC-6
    override func viewDidLoad() {
        super.viewDidLoad()
        let timeHour = Calendar.current.component(.hour, from: Date())
        print("timeHour: \(timeHour)")
        switch timeHour {
        case _ where (timeHour >= 6 && timeHour <= 11):
            print(">=6 && <=11")
            welcomeLabel.text = "Good morning"
            self.view.backgroundColor = UIColor.orange.lighter()
        case _ where (timeHour >= 12 && timeHour <= 17):
            print(">=12 && <=17")
            welcomeLabel.text = "Good afternoon"
            self.view.backgroundColor = UIColor.yellow.lighter()
        case _ where (timeHour >= 18 && timeHour <= 21):
            print(">=18 && <=21")
            welcomeLabel.text = "Good evening"
            self.view.backgroundColor = UIColor.red.lighter()
        case _ where ((timeHour >= 22 && timeHour <= 23) || (timeHour >= 0 && timeHour <= 5)):
            print(">=22 && <=5")
            welcomeLabel.text = "Good night"
            self.view.backgroundColor = UIColor.blue.lighter()
        default:
            print("default case")
        }
    }
    
    // END-UOC-6
    
    @IBAction func unwindToLogin(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Unwind to login")
    }
}
