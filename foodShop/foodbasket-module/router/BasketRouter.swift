//
//  BasketRouter.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation

class BasketRouter : PresenterToRouterBasketProtocol {
    static func createModule(ref: BasketVC) {
        let presenter = BasketPresenter()
        
        //View
        ref.basketPresenter = presenter
        
        //Presenter
        ref.basketPresenter?.basketInteractor = BasketInteractor()
        ref.basketPresenter?.basketView = ref
        
        //Interactor
        ref.basketPresenter?.basketInteractor?.basketPresenter = presenter
    }
}
