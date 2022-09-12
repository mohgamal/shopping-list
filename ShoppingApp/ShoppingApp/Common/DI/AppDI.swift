//
//  AppDI.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

protocol AppDIInterface {
    func productListDependecies() -> ProductListViewModel
    //func productDetailsDependecies() -> ProductDetailsViewModel
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
//
//    func productDetailsDependecies() -> ProductDetailsViewModel {
//        let productDetailsVM = ProductDetailsViewModel()
//        return productDetailsVM
//    }

    func wishListDependecies() -> WishListViewModel {
        let wishListVM = WishListViewModel()
        return wishListVM
    }
}

