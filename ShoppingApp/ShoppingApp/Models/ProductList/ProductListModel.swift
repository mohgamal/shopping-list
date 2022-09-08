//
//  ProductListModel.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import Foundation

struct ProductList: Codable {
    let title : String?
    let currency : String?
    let items : [ProductModel]?
}
