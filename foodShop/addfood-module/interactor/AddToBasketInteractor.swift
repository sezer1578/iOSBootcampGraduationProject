//
//  AddToBasketInteractor.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation
import Alamofire
class AddToBasketInteractor : PresenterToInteractorAddToBasketProtocol {
    func addFood(foodImageName: String, foodName: String, foodPrice: String, foodOrdered: String,userName:String) {
        
        let params:Parameters = ["yemek_adi":foodName,"yemek_resim_adi":foodImageName,"yemek_fiyat":foodPrice,"yemek_siparis_adet":foodOrdered,"kullanici_adi":userName]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response { response in
             if let data = response.data {
                 
                 do{
                     if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                         print(json)
                     }
                   
                 }catch{
                     print(error.localizedDescription)
                 }
             }
        }
    }
}
