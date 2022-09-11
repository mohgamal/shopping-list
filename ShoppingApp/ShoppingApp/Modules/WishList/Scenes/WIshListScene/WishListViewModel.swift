//
//  WishListViewModel.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

class WishListViewModel: ObservableObject {
    @Published var wishList: [ProductModel] = []
    let wishListManager: WishListManager

    init (wishListManager: WishListManager) {
        self.wishListManager = wishListManager
    }

    func getWishListProducts() {
        wishList = wishListManager.getList()
        self.objectWillChange.send()
    }

    func removeProductFromWIshList(id: String) {
        wishList = wishListManager.remove(id: id)
        self.objectWillChange.send()
    }
}
