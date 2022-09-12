//
//  WishListViewModel.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

class WishListViewModel: ObservableObject {
    @Published var wishList: [ProductModel] = []

    init() {
        getWishListProducts()
    }

    func getWishListProducts() {
        wishList = AppEnvironment.wishListManager.getList()
    }

    func removeProductFromWishList(id: String) {
        wishList = AppEnvironment.wishListManager.remove(id: id)
    }
}
