//
//  ProductDetailsViewModel.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation
import Combine

class ProductDetailsViewModel: ObservableObject {

    @Published var isAddedToWishList: Bool = false
    @Published var isAddedToCart: Bool = false

    let product: ProductModel
    let currency: String
    var cancellables = Set<AnyCancellable>()

    init ( product: ProductModel, currency: String) {
        self.product = product
        self.currency = currency
        checkIsAddedToCart()
        checkIsAddedToWishList()
    }

    func checkIsAddedToWishList() {
        AppEnvironment.wishListManager.$products.sink { [weak self] bookmarkedProducts in
            guard let self = self else { return }
            self.isAddedToWishList = Set(bookmarkedProducts.compactMap(\.id)).contains(self.product.id)

        }.store(in: &cancellables)
    }

    func checkIsAddedToCart() {
        AppEnvironment.cartManager.$products.sink { [weak self] cartProducts in
            guard let self = self else { return }
            self.isAddedToCart = Set(cartProducts.compactMap(\.id)).contains(self.product.id)

        }.store(in: &cancellables)
    }

    func addToWishList() {
        let isAdded = AppEnvironment.wishListManager.add(product: self.product)
        self.isAddedToWishList = isAdded
    }

    func addToCart() {
        let isAdded = AppEnvironment.cartManager.add(product: self.product)
        self.isAddedToCart = isAdded
    }
}
