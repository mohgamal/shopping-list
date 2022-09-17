//
//  TagsViewModel.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 12/09/2022.
//

import Foundation
import Combine

class TagsViewModel: ObservableObject {
    let product: ProductModel
    let viewType: ViewType
    @Published var isAddedToWishList: Bool = false
    var cancellables = Set<AnyCancellable>()

    init(product: ProductModel, viewType: ViewType) {
        self.product = product
        self.viewType = viewType
        self.isAddedToWishList = AppEnvironment.wishListManager.checkStatus(id: product.id ?? "")
        checkIsAddedToWishList()
    }

    func checkIsAddedToWishList() {
        AppEnvironment.wishListManager.$products.sink { [weak self] bookmarkedProducts in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isAddedToWishList = Set(bookmarkedProducts.compactMap(\.id)).contains(self.product.id)
            }


        }.store(in: &cancellables)
    }

    func addToWishList() {
        let isAdded = AppEnvironment.wishListManager.add(product: self.product)
        self.isAddedToWishList = isAdded
    }

}
