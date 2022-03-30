//
//  AddToBasketPresenter.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation

class AddToBasketPresenter : ViewToPresenterAddToBasketProtocol {
    var addtoBasketInteractor: PresenterToInteractorAddToBasketProtocol?
    
    func add(foodImageName: String, foodName: String, foodPrice: String, foodOrdered: String, userName:String) {
        addtoBasketInteractor?.addFood(foodImageName: foodImageName, foodName: foodName, foodPrice: foodPrice, foodOrdered: foodOrdered, userName: userName)
    }
    
    
}
