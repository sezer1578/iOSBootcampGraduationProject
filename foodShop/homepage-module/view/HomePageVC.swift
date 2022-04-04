//
//  HomePageVC.swift
//  foodShop
//
//  Created by Sezer Özaltun on 28.03.2022.
//

import UIKit
import FirebaseAuth
import Kingfisher


class HomePageVC: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var basketIcon: UIBarButtonItem!
    
    var foodList = [Food]()
    var homePagePresenter : ViewToPresenterHomePageProtocol?
    var emailAddress = Auth.auth().currentUser?.email
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUI()
        
        view.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        //Delegate
       
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        HomePageRouter.createModule(ref: self)
        
        //Seperator Color
        foodTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
       
       
    
    }
    override func viewWillAppear(_ animated: Bool) {
        homePagePresenter?.loadFood()
        //self.navigationController?.navigationBar.isHidden = true
       
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
extension HomePageVC : PresenterToViewHomePageProtocol {
    func sendDataToView(foodList: Array<Food>) {
        self.foodList = foodList
        DispatchQueue.main.async {
            self.foodTableView.reloadData()
        }
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
        
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    cell.foodImageView.kf.setImage(with:url)
                }
            }
        
        
        cell.foodImageView.image = UIImage(named: food.yemek_resim_adi!)
        cell.foodNameLabel.text = food.yemek_adi
        cell.foodPriceLabel.text = "\(food.yemek_fiyat!) ₺"
        
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
