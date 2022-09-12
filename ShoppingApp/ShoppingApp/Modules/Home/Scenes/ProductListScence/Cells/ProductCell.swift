//
//  ProductCell.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import SwiftUI

struct ProductCell: View {
    var item: ProductModel
    var currency: String
    let viewType: ViewType


    init (item: ProductModel,
          currency: String,
          viewType: ViewType) {
        self.item = item
        self.currency = currency
        self.viewType = viewType
    }

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ProductImageView(product: self.item, viewType: viewType)
            VStack(alignment: .center, spacing: 10) {
                Text(self.item.brand ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.custom(
                        "Roboto-Bold",
                        fixedSize:  FontStyleConstants.init(viewType: viewType).body))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: viewType == .cell ? .leading : .center)

                Text(self.item.name ?? "")
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: viewType == .cell ? .leading : .center)
                    .font(.custom(
                        "Roboto-Regular",
                        fixedSize: FontStyleConstants.init(viewType: viewType).title))

                HStack {
                    if let originalPrice = self.item.originalPrice {
                        Text("\(self.item.price ?? 0) \(self.currency)")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: viewType == .cell ? .leading : .center)
                            .font(.custom(
                                "Roboto-Regular",
                                fixedSize: FontStyleConstants.init(viewType: viewType).body))
                        Text("\(originalPrice) \(self.currency)")
                            .strikethrough()
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: viewType == .cell ? .leading : .center)
                            .font(.custom(
                                "Roboto-Regular",
                                fixedSize: FontStyleConstants.init(viewType: viewType).body))

                    } else {
                        Text("\(self.item.price ?? 0) \(self.currency)")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment:viewType == .cell ? .leading : .center)
                            .font(.custom(
                                "Roboto-Regular",
                                fixedSize: FontStyleConstants.init(viewType: viewType).body))
                    }

                }
            }
            .padding()
        }
    }
}
