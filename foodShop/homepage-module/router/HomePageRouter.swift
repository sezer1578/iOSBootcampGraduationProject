//
//  HomePageRouter.swift
//  foodShop
//
//  Created by Sezer Özaltun on 30.03.2022.
//

import Foundation

class HomePageRouter : PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomePageVC) {
        let presenter = HomePagePresenter()
        
        //View
        ref.homePagePresenter = presenter
        //Presenter
        ref.homePagePresenter?.homePageInteractor = HomePageInteractor()
        ref.homePagePresenter?.homePageView = ref
        //Interactor
        ref.homePagePresenter?.homePageInteractor?.homePagePresenter = presenter
    }
    
}
