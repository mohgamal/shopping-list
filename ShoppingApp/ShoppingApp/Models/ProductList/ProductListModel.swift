//
//  ProductListModel.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import Foundation

struct ProductListModel: Codable {
    let title : String?
    let currency : String?
    var items : [ProductModel]?
}
