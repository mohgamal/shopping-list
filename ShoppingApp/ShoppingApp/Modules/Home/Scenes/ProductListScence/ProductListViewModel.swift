//
//  ProductListViewModel.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var loading = true
    @Published var productResult: ProductListModel?
    var error: Error?
    
    func getData() {
        self.loading = true
        let service = ProductListService(urlString: "https://run.mocky.io/v3/5c138271-d8dd-4112-8fb4-3adb1b7f689e")
        service.getProductList() { [weak self] result in

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
