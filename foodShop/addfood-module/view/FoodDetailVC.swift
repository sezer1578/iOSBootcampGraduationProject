//
//  FoodDetailVC.swift
//  foodShop
//
//  Created by Sezer Özaltun on 29.03.2022.
//

import UIKit
import FirebaseAuth
import Kingfisher

class FoodDetailVC: UIViewController {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var foodOrderedLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var basketbtn: UIButton!
    
    var food:Food?
    var foodBasket:FoodBasket?
    
    //get current username
    var userName = Auth.auth().currentUser?.email
    var addtoBasketPresenter : ViewToPresenterAddToBasketProtocol?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUI()
        
        AddToBasketRouter.createModule(ref: self)
        
        //foodOrderedLabel.text = "1"
        self.navigationController?.navigationBar.isHidden = false
        
       
        
        if let f = food {
            foodNameLabel.text = f.yemek_adi
            foodPriceLabel.text = String(f.yemek_fiyat!)
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(f.yemek_resim_adi!)") {
                    DispatchQueue.main.async {
                        self.foodImage.kf.setImage(with:url)
                    }
                }
        }
    }
    
   
    @IBAction func stepperTapped(_ sender: UIStepper) {
        foodOrderedLabel.text = "\(String(Int(sender.value)))"
    }
    @IBAction func chartIconTapped(_ sender: Any) {
        performSegue(withIdentifier: "detailToBasket", sender: nil)
    }
    
    @IBAction func buttonAddBasket(_ sender: Any) {
        
        var quantity:Int?
        var price:Int?
        var sumPrice:Int?
        
        if let fImage = food?.yemek_resim_adi, let fName = foodNameLabel.text, let foodPrice = foodPriceLabel.text,
           let fOrdered = foodOrderedLabel.text, let userName = userName{
            
            quantity = Int(fOrdered)
            price = Int(foodPrice)
            
            if(quantity! >= 1) {
                sumPrice = quantity! * price!
            }
            let price = String(sumPrice!)
            
            addtoBasketPresenter?.add(foodImageName: fImage, foodName: fName, foodPrice: price, foodOrdered: fOrdered, userName: userName )
        }
        
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
        
        //Button design
        Utilities.styleFilledButton(basketbtn)
       
    }

}
