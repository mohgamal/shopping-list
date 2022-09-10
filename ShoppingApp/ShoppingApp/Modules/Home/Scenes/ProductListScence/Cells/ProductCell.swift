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

    init (item: ProductModel, currency: String) {
        self.item = item
        self.currency = currency
    }

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ProductImageView(tags: self.item.badges ?? [], imageURL: self.item.image ?? "")
            VStack(alignment: .center, spacing: 10) {
                Text(self.item.brand ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.custom(
                        "Roboto-Bold",
                        fixedSize: 14))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(self.item.name ?? "")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom(
                        "Roboto-Regular",
                        fixedSize: 20))

                HStack {
                    if let originalPrice = self.item.originalPrice {
                        Text("\(self.item.price ?? 0) \(self.currency)")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom(
                                "Roboto-Regular",
                                fixedSize: 14))
                        Text("\(originalPrice) \(self.currency)")
                            .strikethrough()
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom(
                                "Roboto-Regular",
                                fixedSize: 14))

                    } else {
                        Text("\(self.item.price ?? 0) \(self.currency)")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom(
                                "Roboto-Regular",
                                fixedSize: 14))
                    }

                }

            }

        }
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(item: ProductModel(id: "1", sku: "11", image: "222", brand: "Name 222", name: "test", price: 100, originalPrice: nil, badges: ["test", "test2", "test3"]), currency: "AED")
    }
}
