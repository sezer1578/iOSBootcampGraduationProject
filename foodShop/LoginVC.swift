//
//  LoginVC.swift
//  foodShop
//
//  Created by Sezer Özaltun on 28.03.2022.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        autoLogin()
        
       
    }
    func setUpElements(){
        
        //Hide error label
        errorLabel.alpha = 0
        
        //Style TextField and Button
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    func autoLogin(){
        let ud = UserDefaults.standard
        ud.set(emailTextField.text!, forKey: "email")
        ud.set(passwordTextField.text!, forKey: "passw" )
       
        let loginDetails = UserDefaults.standard.value(forKey: "email")
        if loginDetails != nil && Auth.auth().currentUser != nil {
            emailTextField.text = UserDefaults.standard.value(forKey: "email") as? String
            passwordTextField.text = UserDefaults.standard.value(forKey: "passw") as? String
            performSegue(withIdentifier: "logintoHome", sender: nil)
        }
        
            
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        //Validate textfields
        
        //Create cleaned versions the textfield
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Sign in the user
        Auth.auth().signIn(withEmail: email, password: password){(result, error) in
            if error != nil {
                //Coulndn't sign in
                self.errorLabel.text = "Email veya şifre yanlıştır"
                self.errorLabel.alpha = 1
            }else{
                self.performSegue(withIdentifier: "logintoHome", sender: nil)
               
            }
        }
    }
    
}
