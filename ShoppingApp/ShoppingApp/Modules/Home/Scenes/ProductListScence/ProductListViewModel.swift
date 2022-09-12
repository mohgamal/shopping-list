//
//  ProductListViewModel.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    @Published var loading = true
    @Published var productResult: ProductListModel?

    let prouctListService: ProductListServiceInterface
    let wishListManager: WishListManager
    let cartManager: CartManager

    var error: Error?

    init (productListService: ProductListServiceInterface,
          wishListManager: WishListManager,
          cartManager: CartManager) {
        self.prouctListService = productListService
        self.wishListManager = wishListManager
        self.cartManager = cartManager
    }

    
    func getData() {
        self.loading = true
        prouctListService.getProductList() { [weak self] result in
            DispatchQueue.main.async {
                self?.loading = false
                switch result {
                case .success(let result):
                    self?.productResult = result
                    self?.objectWillChange.send()
                case .failure(let error):
                    self?.error = error
                    self?.objectWillChange.send()
                }
            }
        }
    }
}
