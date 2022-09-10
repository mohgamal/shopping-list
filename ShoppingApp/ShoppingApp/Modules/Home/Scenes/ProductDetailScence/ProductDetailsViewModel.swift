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

    init (wishListManager: WishListManager, cartManager: CartManager) {
        self.wishListManager = wishListManager
        self.cartManager = cartManager
    }
}
