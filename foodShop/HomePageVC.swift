//
//  HomePageVC.swift
//  foodShop
//
//  Created by Sezer Özaltun on 28.03.2022.
//

import UIKit
import FirebaseAuth

class HomePageVC: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var foodTableView: UITableView!
    
    var foodList = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUI()
        
        view.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        //Delegate
        searchBar.delegate = self
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        //Seperator Color
        foodTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
        let f1 = Food(foodId: 1, foodName: "Fanta", foodImageName: "fanta", foodPrice: 10)
        let f2 = Food(foodId: 2, foodName: "Ayran", foodImageName: "ayran", foodPrice: 5)
        let f3 = Food(foodId: 3, foodName: "Baklava", foodImageName: "baklava", foodPrice: 20)
        let f4 = Food(foodId: 4, foodName: "Izgara Somon", foodImageName: "izgarasomon", foodPrice: 70)
        let f5 = Food(foodId: 5, foodName: "Izgara Tavuk", foodImageName: "izgaratavuk", foodPrice: 40)
        let f6 = Food(foodId: 6, foodName: "Kadayıf", foodImageName: "kadayif", foodPrice: 15)
        foodList.append(f1)
        foodList.append(f2)
        foodList.append(f3)
        foodList.append(f4)
        foodList.append(f5)
        foodList.append(f6)
        
    }
   
    @IBAction func buttonSignOut(_ sender: Any) {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            
            do{
                try FirebaseAuth.Auth.auth().signOut()
            }catch{ print("Error")}
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
extension HomePageVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonucu : \(searchText)")
    }
}
extension HomePageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        as! FoodTableViewCell
        
        cell.foodImageView.image = UIImage(named: food.foodImageName!)
        cell.foodNameLabel.text = food.foodName
        cell.foodPriceLabel.text = "\(food.foodPrice!) ₺"
        
        cell.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        cell.cellBackground.layer.cornerRadius = 30.0
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = foodList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: food)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let food = sender as? Food
            let goVC = segue.destination as! FoodDetailVC
            goVC.food = food
        }
    }
}
