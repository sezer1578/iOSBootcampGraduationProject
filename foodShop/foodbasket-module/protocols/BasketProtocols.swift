//
//  BasketProtocols.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation
 
protocol ViewToPresenterBasketProtocol {
    var basketInteractor:PresenterToInteractorBasketProtocol? {get set}
    var basketView:PresenterToViewBasketProtocol? {get set}
    func loadFood(userName:String)
    func delete(basketFoodId:String,userName:String)
}
protocol PresenterToInteractorBasketProtocol {
    var basketPresenter:InteractorToPresenterBasketProtocol? {get set}
    func getAllFood(userName:String)
    func deleteFood(basketFoodId:String,userName:String)
}
protocol InteractorToPresenterBasketProtocol {
    func sendDataToPresenter(foodList:Array<FoodBasket>)
}
protocol PresenterToViewBasketProtocol {
    func sendDataToView(foodList:Array<FoodBasket>)
}
protocol PresenterToRouterBasketProtocol {
    static func createModule(ref:BasketVC)
}
