//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import SwiftUI

@main
struct ShoppingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView(vm: ProductListViewModel())
        }
    }
}
