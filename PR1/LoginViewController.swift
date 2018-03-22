//
//  LoginViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!

    // BEGIN-UOC-2
    @IBAction func loginTapped(_ sender: UIButton) {
        // Obtenemos los valores introducidos en los campos de texto
        let username = usernameField.text!
        let password = passwordField.text!
        
        // Validamos las credenciales introducidas con la función Services.validate
        let loginAllowed = Services.validate(username: username, password: password)

        if loginAllowed == true {
            // Login correcto
            performSegue(withIdentifier: "SegueToAuthentication", sender: self)
        }else{
            // Login incorrecto, mostramos mensaje de error
            Utils.show(Message: "Sorry, the username and password are invalid", WithTitle: "Login failed", InViewController: self)
        }
        
    }
    // END-UOC-2
    
    // BEGIN-UOC-5
    // Limpiando campos de texto cada vez que se muestra la pantalla de login
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        usernameField.text = ""
        passwordField.text = ""
    }
    // END-UOC-5
    
    // BEGIN-UOC-6
    // Definición del color de fondo de la pantalla y mensaje de bienvenida en función de la hora actual
    override func viewDidLoad() {
        super.viewDidLoad()
        let timeHour = Calendar.current.component(.hour, from: Date())
        print("timeHour: \(timeHour)")
        switch timeHour {
        case _ where (timeHour >= 6 && timeHour <= 11):
            welcomeLabel.text = "Good morning"
            self.view.backgroundColor = UIColor.orange.lighter()
        case _ where (timeHour >= 12 && timeHour <= 17):
            welcomeLabel.text = "Good afternoon"
            self.view.backgroundColor = UIColor.yellow.lighter()
        case _ where (timeHour >= 18 && timeHour <= 21):
            welcomeLabel.text = "Good evening"
            self.view.backgroundColor = UIColor.red.lighter()
        case _ where ((timeHour >= 22 && timeHour <= 23) || (timeHour >= 0 && timeHour <= 5)):
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
