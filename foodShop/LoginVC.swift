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
    }
    func setUpElements(){
        
        //Hide error label
        errorLabel.alpha = 0
        
        //Style TextField and Button
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
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
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }else{
                let homeViewPage = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomePageVC
                self.view.window?.rootViewController = homeViewPage
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}
