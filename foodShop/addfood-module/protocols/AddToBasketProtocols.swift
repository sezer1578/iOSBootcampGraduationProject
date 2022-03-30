//
//  AddToBasketProtocols.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation

protocol ViewToPresenterAddToBasketProtocol {
    var addtoBasketInteractor : PresenterToInteractorAddToBasketProtocol? {get set}
    func add(foodImageName:String,foodName:String,foodPrice:String,foodOrdered:String,userName:String)
}
protocol PresenterToInteractorAddToBasketProtocol {
    func addFood(foodImageName:String,foodName:String,foodPrice:String,foodOrdered:String,userName:String)
}
protocol PresenterToRouterAddToBasketProtocol {
    static func createModule(ref:FoodDetailVC)
}
