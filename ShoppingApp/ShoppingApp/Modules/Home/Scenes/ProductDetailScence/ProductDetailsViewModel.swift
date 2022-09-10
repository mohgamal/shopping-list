//
//  ProductDetailsViewModel.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation
class ProductDetailsViewModel: ObservableObject {
    let wishListManager: WishListManager
    let cartManager: CartManager

    @Published var isAddedToWishList: Bool = false
    @Published var isAddedToCart: Bool = false

    init (wishListManager: WishListManager, cartManager: CartManager) {
        self.wishListManager = wishListManager
        self.cartManager = cartManager
    }

    @discardableResult
    func checkIsAddedToWishList(itemId: String) -> Bool {
        let status = wishListManager.checkStatus(id: itemId)
        self.isAddedToWishList = status
        return status
    }

    @discardableResult
    func checkIsAddedToCart(itemId: String) -> Bool {
        let status = cartManager.checkStatus(id: itemId)
        self.isAddedToCart = status
        return status
    }
}
