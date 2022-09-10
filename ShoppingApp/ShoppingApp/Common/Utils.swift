//
//  Utils.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

final class Utils {

    @discardableResult
    static func addToWishList(item: ProductModel) -> Bool {
        var wishList: [ProductModel] = []
        var added: Bool = false
        if let wishListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.wishList) as? Data {
            if let wishListWrapped = try?  PropertyListDecoder().decode([ProductModel].self, from: wishListResult) {
                wishList = wishListWrapped
                if wishList.contains(where: { $0.id == item.id}) {
                    wishList = removeFromWishList(itemId: item.id ?? "")
                    added = false
                } else {
                    wishList.append(item)
                    added = true
                }
            }
        } else {
            wishList.append(item)
            added = true
        }

        UserDefaults.standard.set( try? PropertyListEncoder().encode(wishList), forKey: UserDefaultKeys.wishList)
        return added
    }

    static func removeFromWishList(itemId: String) -> [ProductModel] {
        var wishList: [ProductModel] = []
        if let wishListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.wishList) as? Data {
            if let wishListWrapped = try?  PropertyListDecoder().decode([ProductModel].self, from: wishListResult) {
                wishList = wishListWrapped
                wishList.removeAll(where: { $0.id == itemId})
                UserDefaults.standard.set( try? PropertyListEncoder().encode(wishList), forKey: UserDefaultKeys.wishList)
            }
        }
        return wishList
    }

    static func checkItemStatus(itemId: String) -> Bool {
        var wishList: [ProductModel] = []
        if let wishListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.wishList) as? Data {
            if let wishListWrapped = try?  PropertyListDecoder().decode([ProductModel].self, from: wishListResult) {
                wishList = wishListWrapped
                if wishList.contains(where: { $0.id == itemId}) {
                    return true
                }
            }
        }

        return false
    }

    static func getWishList() -> [ProductModel] {
        if let wishListResult = UserDefaults.standard.object(forKey: UserDefaultKeys.wishList) as? Data {
            if let wishList = try?  PropertyListDecoder().decode([ProductModel].self, from: wishListResult) {
                return wishList
            }
        }
        return []
    }
}
