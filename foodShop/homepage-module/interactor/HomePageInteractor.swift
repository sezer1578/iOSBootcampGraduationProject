//
//  HomePageInteractor.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation
import Alamofire
class HomePageInteractor : PresenterToInteractorHomePageProtocol {
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    
    func getAllFood() {
       AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).response{ response in
            if let data = response.data {
                do{
                    let response = try JSONDecoder().decode(FoodResponse.self, from: data)
                    if let getList = response.yemekler{
                        self.homePagePresenter?.sendDataToPresenter(foodList: getList)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    
}
