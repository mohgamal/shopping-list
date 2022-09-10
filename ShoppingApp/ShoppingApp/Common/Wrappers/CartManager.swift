//
//  CartManager.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

final class CartManager: UserDefaultWrapperInterface {

    @discardableResult
    func add(product: ProductModel) -> Bool {
        var cartList: [ProductModel] = []
        var added: Bool = false
        if let cartListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.cart) as? Data {
            if let cartListWrapped = try?  PropertyListDecoder().decode([ProductModel].self, from: cartListResult) {
                cartList = cartListWrapped
                if cartList.contains(where: { $0.id == product.id}) {
                    cartList = remove(id: product.id ?? "")
                    added = false
                } else {
                    cartList.append(product)
                    added = true
                }
            }
        } else {
            cartList.append(product)
            added = true
        }

        UserDefaults.standard.set( try? PropertyListEncoder().encode(cartList), forKey: UserDefaultKeys.cart)
        return added
    }


    func checkStatus(id: String) -> Bool {
        var cartList: [ProductModel] = []
        if let cartListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.cart) as? Data {
            if let cartListWrapped = try?  PropertyListDecoder().decode([ProductModel].self, from: cartListResult) {
                cartList = cartListWrapped
                if cartList.contains(where: { $0.id == id}) {
                    return true
                }
            }
        }
        
        return false
    }
}
