//
//  WishListProductCell.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 11/09/2022.
//

import Foundation
import SwiftUI

struct WishListProductCell: View {
    @ObservedObject private var imageLoader: DataLoader
    let product: ProductModel
let currency = "AED"

    init (product: ProductModel) {
        self.product = product
        imageLoader = DataLoader(resourseURL: URL(string: product.image ?? ""))
    }
    var body: some View {
        HStack {
            if let uiImage = UIImage(data: self.imageLoader.data) {
                AnyView(Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.0, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                )
            } else {
                AnyView(Image(systemName: "camera")
                    .resizable()
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.0, brightness: 1.0)/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .onAppear(perform: { self.imageLoader.loadImage() }))

            }
            VStack {
                Text(product.brand ?? "")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                Text("\(product.name ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)

                HStack {
                    if let originalPrice = self.product.originalPrice {
                        Text("\(self.product.price ?? 0) \(self.currency)")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom(
                                "Roboto-Regular",
                                fixedSize: FontStyleConstants.init(viewType: .cell).body))
                        Text("\(originalPrice) \(self.currency)")
                            .strikethrough()
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment:.leading )
                            .font(.custom(
                                "Roboto-Regular",
                                fixedSize: FontStyleConstants.init(viewType: .cell).body))

                    } else {
                        Text("\(self.product.price ?? 0) \(self.currency)")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.custom(
                                "Roboto-Regular",
                                fixedSize: FontStyleConstants.init(viewType: .cell).body))
                    }
                }
                
            }
        }
        .frame(alignment: .topTrailing)
        .padding()
    }
}
