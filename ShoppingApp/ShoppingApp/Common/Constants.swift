//
//  Constants.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation
import SwiftUI

struct FontStyleConstants {
    let viewType: ViewType

    init (viewType: ViewType) {
        self.viewType = viewType
    }

    var body: CGFloat {
        get {
            switch viewType {
            case .cell:
                return 14
            case .details:
                return 26
            }
        }
    }

    var subTitle: CGFloat {
        get {
            switch viewType {
            case .cell:
                return 12
            case .details:
                return 20
            }
        }
    }

    var title: CGFloat {
        get {
            switch viewType {
            case .cell:
                return 18
            case .details:
                return 30
            }
        }
    }
}

struct UserDefaultKeys {
    static let wishList = "wishListKey"
}
