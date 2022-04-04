//
//  BasketVC.swift
//  foodShop
//
//  Created by Sezer Özaltun on 29.03.2022.
//

import UIKit
import FirebaseAuth

class BasketVC: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var basketTableView: UITableView!
    
    
    var foodList = [FoodBasket]()
    var userName = Auth.auth().currentUser?.email
    
    var basketPresenter:ViewToPresenterBasketProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUI()
        
        view.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        bottomView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        
        //Delegate
        basketTableView.delegate = self
        basketTableView.dataSource = self
        
        BasketRouter.createModule(ref: self)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        
        basketPresenter?.loadFood(userName: userName!)
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
extension BasketVC : PresenterToViewBasketProtocol {
    func sendDataToView(foodList: Array<FoodBasket>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.basketTableView.reloadData()
        }
        
    }
}

extension BasketVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foodBasket = foodList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath)
        as! BasketTableViewCell
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(foodBasket.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    cell.basketFoodImageView.kf.setImage(with:url)
                }
            }
        cell.basketFoodNameLabel.text = foodBasket.yemek_adi
        cell.basketFoodPriceLabel.text = "Fiyat: \(foodBasket.yemek_fiyat!) ₺"
        cell.basketFoodOrderedLabel.text = "Adet: \(foodBasket.yemek_siparis_adet!)"
        
        cell.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        cell.cellBackground.layer.cornerRadius = 30.0

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: ""){(contextualAction,view,bool) in
            let food = self.foodList[indexPath.row]
            
            let alert = UIAlertController(title: "Sil", message: "\(food.yemek_adi!) sepetinden silinsin mi?", preferredStyle: .alert)
            self.present(alert,animated: true)
            
            let cancelAction = UIAlertAction(title: "İptal", style: .cancel){action in
        
            }
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Evet", style: .destructive){action in
                self.basketPresenter?.delete(basketFoodId: (food.sepet_yemek_id!), userName: self.userName!)
                
            }
            alert.addAction(yesAction)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
