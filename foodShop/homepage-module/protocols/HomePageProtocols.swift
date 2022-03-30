//
//  HomePageProtocols.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation

protocol ViewToPresenterHomePageProtocol {
    var homePageInteractor:PresenterToInteractorHomePageProtocol? {get set}
    var homePageView:PresenterToViewHomePageProtocol? {get set}
    func loadFood()
}
protocol PresenterToInteractorHomePageProtocol {
    var homePagePresenter:InteractorToPresenterHomePageProtocol? {get set}
    func getAllFood()
}
protocol InteractorToPresenterHomePageProtocol {
    func sendDataToPresenter(foodList:Array<Food>)
}
protocol PresenterToViewHomePageProtocol {
    func sendDataToView(foodList:Array<Food>)
    
}
protocol PresenterToRouterHomePageProtocol {
    static func createModule(ref:HomePageVC)
}
