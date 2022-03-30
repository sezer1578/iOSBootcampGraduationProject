//
//  AddToBasketRouter.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation

class AddToBasketRouter : PresenterToRouterAddToBasketProtocol {
    static func createModule(ref: FoodDetailVC) {
        ref.addtoBasketPresenter = AddToBasketPresenter()
        ref.addtoBasketPresenter?.addtoBasketInteractor = AddToBasketInteractor()
    }
}
