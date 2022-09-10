//
//  UserDefaultsWrapper.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

protocol UserDefaultWrapperInterface {
    func add(product: ProductModel) -> Bool
    func remove(id: String) -> [ProductModel]
    func checkStatus(id: String) -> Bool
    func getList() -> [ProductModel]
}

extension UserDefaultWrapperInterface {
    func remove(id: String) -> [ProductModel] { return []}
    func getList() -> [ProductModel] { return []}
}
