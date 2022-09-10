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

    init (wishListManager: WishListManager, cartManager: CartManager) {
        self.wishListManager = wishListManager
        self.cartManager = cartManager
    }

    @discardableResult
    func checkIsAddedToWIshList(itemId: String) -> Bool {
        let status = WishListManager().checkStatus(id: itemId)
        self.isAddedToWishList = status
        return status
    }
}
