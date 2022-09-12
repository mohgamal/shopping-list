//
//  AppEnvironment.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation

enum AppEnvironment {
    static let baseURL = "https://run.mocky.io/v3/5c138271-d8dd-4112-8fb4-3adb1b7f689e"

    static let wishListManager = WishListManager.shared
    static let cartManager = CartManager.shared
}
