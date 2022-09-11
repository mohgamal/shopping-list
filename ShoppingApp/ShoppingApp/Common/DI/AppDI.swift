//
//  AppDI.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

protocol AppDIInterface {
    func productListDependecies() -> ProductListViewModel
    func productDetailsDependecies() -> ProductDetailsViewModel
    func wishListDependecies() -> WishListViewModel
}


class AppDI: AppDIInterface {

    static let shared = AppDI(appEnvironment: AppEnvironment())

    let appEnvironment: AppEnvironment

    init (appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }

    func productListDependecies() -> ProductListViewModel {
        let productListDI = HomeSceneDI(appEnvironment: appEnvironment)
        let productListVM = productListDI.productListDependecies()
        return productListVM
    }

    func productDetailsDependecies() -> ProductDetailsViewModel {
        let wishListManager = WishListManager()
        let cartManager = CartManager()

        let productDetailsVM = ProductDetailsViewModel(wishListManager: wishListManager, cartManager: cartManager)
        return productDetailsVM
    }

    func wishListDependecies() -> WishListViewModel {
        let wishListManager = WishListManager()
        let wishListVM = WishListViewModel(wishListManager: wishListManager)
        return wishListVM
    }
}

