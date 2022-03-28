//
//  HomePageVC.swift
//  foodShop
//
//  Created by Sezer Özaltun on 28.03.2022.
//

import UIKit
import FirebaseAuth

class HomePageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonSignOut(_ sender: Any) {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            
            do{
                try FirebaseAuth.Auth.auth().signOut()
            }catch{ print("Error")}
        }
    }
}
