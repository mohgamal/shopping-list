//
//  AppDI.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

protocol AppDIInterface {
    func productListDependecies() -> ProductListViewModel
    func productDetailsDependecies(product: ProductModel, currency: String) -> ProductDetailsViewModel
    func wishListDependecies() -> WishListViewModel
}


class AppDI: AppDIInterface {

    static let shared = AppDI()


    init () {
    }

    func productListDependecies() -> ProductListViewModel {
        let productListDI = HomeSceneDI()
        let productListVM = productListDI.productListDependecies()
        return productListVM
    }

    func productDetailsDependecies(product: ProductModel, currency: String) -> ProductDetailsViewModel {
        let productDetailsVM = ProductDetailsViewModel(product: product, currency: currency)
        return productDetailsVM
    }

    func wishListDependecies() -> WishListViewModel {
        let wishListVM = WishListViewModel()
        return wishListVM
    }
}

