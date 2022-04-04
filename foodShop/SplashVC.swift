//
//  ViewController.swift
//  foodShop
//
//  Created by Sezer Özaltun on 28.03.2022.
//

import UIKit
import AVKit
import grpc
import FirebaseAuth

class SplashVC: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AutoLogin
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "toLogin", sender: nil)
        }
        
        setUpElements()
        
    }
   

    @IBAction func loginButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toLogin", sender: nil)
    }
    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
}

