//
//  FoodBasket.swift
//  foodShop
//
//  Created by Sezer Özaltun on 29.03.2022.
//

import Foundation

class FoodBasket {
    var foodBasketId:Int?
    var foodName:String?
    var foodImageName:String?
    var foodPrice:Int?
    var foodOrdered:Int?
    var userName:String?
    
    init(){
        
    }
    init(foodBasketId:Int,foodName:String,foodImageName:String,foodPrice:Int,foodOrdered:Int,userName:String){
        self.foodBasketId = foodBasketId
        self.foodName = foodName
        self.foodImageName = foodImageName
        self.foodPrice = foodPrice
        self.foodOrdered = foodOrdered
        self.userName = userName
    }
}
