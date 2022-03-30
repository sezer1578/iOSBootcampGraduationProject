//
//  FoodBasketResponse.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation

class FoodBasketResponse : Codable {
    var sepet_yemekler:[FoodBasket]?
    var success:Int?
}
