//
//  HomeSceneDI.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

class HomeSceneDI {

    let appEnvironment: AppEnvironment

    init (appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }

    func productListDependecies() -> ProductListViewModel {
        let serviceURL = appEnvironment.baseURL
        let productListService = ProductListService(urlString: serviceURL)
        let wishListManager = WishListManager()
        let cartManager = CartManager()
        let productListVM = ProductListViewModel(productListService: productListService,
                                                 wishListManager: wishListManager,
                                                 cartManager: cartManager)
        return productListVM
    }
}
