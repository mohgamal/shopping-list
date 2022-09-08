//
//  Item.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import Foundation

struct ProductModel : Codable, Identifiable {
    let id : String?
    let sku : String?
    let image : String?
    let brand : String?
    let name : String?
    let price : Int?
    let originalPrice : Int?
    let badges : [String]?
}
