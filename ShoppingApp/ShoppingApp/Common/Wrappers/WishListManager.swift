//
//  WishListManager.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

final class WishListManager: UserDefaultWrapperInterface {

    @Published private(set) var products: [ProductModel] = []
    static let shared = WishListManager()

    @discardableResult
    func add(product: ProductModel) -> Bool {
        var wishList: [ProductModel] = []
        var added: Bool = false
        if let wishListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.wishList) as? Data {
            if let wishListWrapped = try?  PropertyListDecoder().decode([ProductModel].self, from: wishListResult) {
                wishList = wishListWrapped
                if wishList.contains(where: { $0.id == product.id}) {
                    wishList = remove(id: product.id ?? "")
                    added = false
                } else {
                    wishList.append(product)
                    added = true
                }
            }
        } else {
            wishList.append(product)
            added = true
        }

        UserDefaults.standard.set( try? PropertyListEncoder().encode(wishList), forKey: UserDefaultKeys.wishList)

        self.products = wishList
        return added
    }

    func remove(id: String) -> [ProductModel] {
        var wishList: [ProductModel] = []
        if let wishListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.wishList) as? Data {
            if let wishListWrapped = try?  PropertyListDecoder().decode([ProductModel].self, from: wishListResult) {
                wishList = wishListWrapped
                wishList.removeAll(where: { $0.id == id})
                UserDefaults.standard.set( try? PropertyListEncoder().encode(wishList), forKey: UserDefaultKeys.wishList)
            }
        }
        self.products = wishList
        return wishList
    }

    func checkStatus(id: String) -> Bool {
        var wishList: [ProductModel] = []
        if let wishListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.wishList) as? Data {
            if let wishListWrapped = try?  PropertyListDecoder().decode([ProductModel].self, from: wishListResult) {
                wishList = wishListWrapped
                self.products = wishList
                if wishList.contains(where: { $0.id == id}) {
                    return true
                }
            }
        }

        return false
    }

    func getList() -> [ProductModel] {
        if let wishListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.wishList) as? Data {
            if let wishList = try?  PropertyListDecoder().decode([ProductModel].self, from: wishListResult) {
                self.products = wishList
                return wishList
            }
        }
        return []
    }

}
