//
//  FoodDetailVC.swift
//  foodShop
//
//  Created by Sezer Özaltun on 29.03.2022.
//

import UIKit

class FoodDetailVC: UIViewController {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var foodOrderedLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    var food:Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUI()
        
        if let f = food {
            foodImage.image = UIImage(named: f.foodImageName!)
            foodNameLabel.text = f.foodName
            foodPriceLabel.text = "\(f.foodPrice!) ₺"
            
        }
    }
    
    @IBAction func chartIconTapped(_ sender: Any) {
        performSegue(withIdentifier: "detailToBasket", sender: nil)
    }
    
    @IBAction func buttonAddBasket(_ sender: Any) {
        if let f = food {
            print("\(f.foodName!) added to basket ")
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
       
    }

}
