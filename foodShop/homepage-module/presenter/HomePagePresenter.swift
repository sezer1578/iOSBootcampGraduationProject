//
//  HomePagePresenter.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation

class HomePagePresenter : ViewToPresenterHomePageProtocol {
    var homePageInteractor: PresenterToInteractorHomePageProtocol?
    var homePageView: PresenterToViewHomePageProtocol?
    
    func loadFood() {
        homePageInteractor?.getAllFood()
    }
}
extension HomePagePresenter : InteractorToPresenterHomePageProtocol {
    func sendDataToPresenter(foodList: Array<Food>) {
        homePageView?.sendDataToView(foodList: foodList)
    }
    
    
}
