//
//  Food.swift
//  foodShop
//
//  Created by Sezer Özaltun on 29.03.2022.
//

import Foundation

class Food {
    var foodId:Int?
    var foodName:String?
    var foodImageName:String?
    var foodPrice:Int?
    
    init(){
        
    }
    init(foodId:Int,foodName:String,foodImageName:String,foodPrice:Int){
        self.foodId = foodId
        self.foodName = foodName
        self.foodImageName = foodImageName
        self.foodPrice = foodPrice
    }
}
