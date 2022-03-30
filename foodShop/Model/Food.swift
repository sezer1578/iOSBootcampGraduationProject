//
//  Food.swift
//  foodShop
//
//  Created by Sezer Özaltun on 29.03.2022.
//

import Foundation

class Food : Codable {
    var yemek_id:String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    
    init(){
        
    }
    init(foodId:String,foodName:String,foodImageName:String,foodPrice:String){
        self.yemek_id = foodId
        self.yemek_adi = foodName
        self.yemek_resim_adi = foodImageName
        self.yemek_fiyat = foodPrice
    }
}
