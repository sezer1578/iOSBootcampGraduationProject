//
//  BasketVC.swift
//  foodShop
//
//  Created by Sezer Özaltun on 29.03.2022.
//

import UIKit

class BasketVC: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var basketTableView: UITableView!
    
    var foodList = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUI()
        
        view.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        bottomView.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        
        //Delegate
        basketTableView.delegate = self
        basketTableView.dataSource = self
        
        let f1 = Food(foodId: 1, foodName: "Ayran", foodImageName: "ayran", foodPrice: 12)
        let f2 = Food(foodId: 2, foodName: "Fanta", foodImageName: "fanta", foodPrice: 15)
        let f3 = Food(foodId: 3, foodName: "Baklava", foodImageName: "baklava", foodPrice: 20)
        foodList.append(f1)
        foodList.append(f2)
        foodList.append(f3)
       
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
extension BasketVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foodBasket = foodList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketCell", for: indexPath)
        as! BasketTableViewCell
        
        cell.basketFoodImageView.image = UIImage(named: foodBasket.foodImageName!)
        cell.basketFoodNameLabel.text = foodBasket.foodName
        cell.basketFoodPriceLabel.text = "\(foodBasket.foodPrice!) ₺"
        cell.basketFoodOrderedLabel.text = "1"
        
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
            
            let alert = UIAlertController(title: "Delete", message: "Are you sure delete \(food.foodName!) note ?", preferredStyle: .alert)
            self.present(alert,animated: true)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){action in
        
            }
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){action in
                print("\(food.foodName!) Deleted")
                self.foodList.remove(at: indexPath.row)
                tableView.reloadData()
            }
            alert.addAction(yesAction)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
