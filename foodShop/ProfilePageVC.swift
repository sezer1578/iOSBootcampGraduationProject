//
//  ProfilePageVC.swift
//  foodShop
//
//  Created by Sezer Özaltun on 2.04.2022.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class ProfilePageVC: UIViewController {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var exitbtn: UIButton!
    @IBOutlet weak var basketbtn: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        showUI()
        
        let email = Auth.auth().currentUser?.email
        let uid = Auth.auth().currentUser?.uid
        
        emailLabel.text = "Email: \(email!)"
        
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid!)
        
        docRef.addSnapshotListener({ snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            guard let name = data["name"] as? String else {
                return
            }
            guard let surname = data["surname"] as? String else {
                return
            }
            DispatchQueue.main.async {
                self.userNameLabel.text = "Adı: \(name)"
                self.surnameLabel.text = "Soyadı: \(surname)"
            }
            
        } )
       
        
        
    }
    func showUI(){
        
        //TopView UI
        topView.layer.cornerRadius = 100
        topView.layer.maskedCorners = [.layerMinXMaxYCorner]
        topView.layer.shadowRadius = 10
        topView.layer.shadowOpacity = 1.0
        topView.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Bottom View UI
        bottomView.layer.cornerRadius = 100
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner]
        bottomView.layer.shadowRadius = 2
        bottomView.layer.shadowOpacity = 0.3
        bottomView.layer.shadowOffset = CGSize(width: 3, height: 3)
        
        //Button Design
        Utilities.styleFilledButton(basketbtn)
        Utilities.styleHollowButton(exitbtn)
        
        //Label design
        Utilities.styleLabel(userNameLabel)
        Utilities.styleLabel(surnameLabel)
        Utilities.styleLabel(emailLabel)
    }

    @IBAction func buttonExit(_ sender: Any) {
        
        let alert = UIAlertController(title: "Çıkış Yap", message: "Hesabından çıkış yapmak istiyor musun ? Hesabından çıkış yaparsan uygulama kapanacaktır.", preferredStyle: .alert)
        self.present(alert,animated: true)
        
        let cancelAction = UIAlertAction(title: "İptal", style: .cancel){action in
    
        }
        alert.addAction(cancelAction)
        
        let yesAction = UIAlertAction(title: "Evet", style: .destructive){action in
           
            if Auth.auth().currentUser != nil {
                do{
                    try Auth.auth().signOut()
                    exit(0)
                }catch{
                    print("An error occured")
                }
            }
        }
        alert.addAction(yesAction)
        
      
        
    }
    
    @IBAction func buttonBasket(_ sender: Any) {
    }
}
