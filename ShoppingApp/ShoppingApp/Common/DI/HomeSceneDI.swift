//
//  HomeSceneDI.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

class HomeSceneDI {
    func productListDependecies() -> ProductListViewModel {
        let serviceURL = AppEnvironment.baseURL
        let productListService = ProductListService(urlString: serviceURL)
        let wishListManager = WishListManager.shared
        let cartManager = CartManager()
        let productListVM = ProductListViewModel(productListService: productListService,
                                                 wishListManager: wishListManager,
                                                 cartManager: cartManager)
        return productListVM
    }
}
