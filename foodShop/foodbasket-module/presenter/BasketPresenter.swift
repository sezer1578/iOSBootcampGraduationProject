//
//  BasketPresenter.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation

class BasketPresenter : ViewToPresenterBasketProtocol {
    var basketInteractor: PresenterToInteractorBasketProtocol?
    var basketView: PresenterToViewBasketProtocol?
    
    func loadFood(userName:String) {
        basketInteractor?.getAllFood(userName: userName)
    }
    
    func delete(basketFoodId: String, userName: String) {
        basketInteractor?.deleteFood(basketFoodId: basketFoodId, userName: userName)
    }
}
extension BasketPresenter : InteractorToPresenterBasketProtocol {
    func sendDataToPresenter(foodList: Array<FoodBasket>) {
        basketView?.sendDataToView(foodList: foodList)
    }
}
