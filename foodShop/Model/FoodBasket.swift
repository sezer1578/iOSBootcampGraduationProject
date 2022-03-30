//
//  FoodBasket.swift
//  foodShop
//
//  Created by Sezer Özaltun on 29.03.2022.
//

import Foundation

class FoodBasket : Codable{
    var sepet_yemek_id:String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    var yemek_siparis_adet:String?
    var kullanici_adi:String?
    
    init(){
        
    }
    init(foodBasketId:String,foodName:String,foodImageName:String,foodPrice:String,foodOrdered:String,userName:String){
        self.sepet_yemek_id = foodBasketId
        self.yemek_adi = foodName
        self.yemek_resim_adi = foodImageName
        self.yemek_fiyat = foodPrice
        self.yemek_siparis_adet = foodOrdered
        self.kullanici_adi = userName
    }
}
