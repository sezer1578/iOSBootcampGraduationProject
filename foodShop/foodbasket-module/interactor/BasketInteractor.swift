//
//  BasketInteractor.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation
import Alamofire

class BasketInteractor : PresenterToInteractorBasketProtocol {
    var basketPresenter: InteractorToPresenterBasketProtocol?
    
    func getAllFood(userName:String) {
        let params:Parameters = ["kullanici_adi":userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post, parameters: params).response{ response in
             if let data = response.data {
                 do{
                     let response = try JSONDecoder().decode(FoodBasketResponse.self, from: data)
                     if let getList = response.sepet_yemekler{
                         self.basketPresenter?.sendDataToPresenter(foodList: getList)
                     }
                 }catch{
                     print(error.localizedDescription)
                 }
             }
         }
     
       
    }
    
    func deleteFood(basketFoodId: String, userName: String) {
        
        let params:Parameters = ["sepet_yemek_id":basketFoodId,"kullanici_adi":userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).response { response in
             if let data = response.data {
                 
                 do{
                     if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                         print(json)
                         self.getAllFood(userName: userName)
                     }
                   
                 }catch{
                     print(error.localizedDescription)
                 }
             }
        }
    }
    
    
}
