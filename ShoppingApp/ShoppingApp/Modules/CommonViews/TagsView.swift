//
//  TagsView.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import SwiftUI

struct TagsView: View {
    let product: ProductModel
    let viewType: ViewType
    let wishListManager: WishListManager

    @State var isSelected : Bool = false
    
    init (product: ProductModel, viewType: ViewType, wishListManager: WishListManager) {
        self.product = product
        self.viewType = viewType
        self.wishListManager = wishListManager
    }
    
    var body: some View {
        HStack {
            HStack( spacing: 5.0) {
                ForEach(product.badges ?? [] ,id: \.self) { tag in
                    Text(tag)
                        .font(.custom(
                            "Roboto-Regular",
                            fixedSize: FontStyleConstants.init(viewType: viewType).subTitle))
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.948))
                        .foregroundColor(.black)
                }
            }
            .padding(.leading, 5.0)

            if viewType == .cell {
                HStack{
                    Button(action: {
                        self.isSelected.toggle()
                        wishListManager.add(product: product)
                        checkIsAddedToWIshList()
                    }, label: {
                        Image(systemName: self.isSelected ? "bookmark.fill" : "bookmark")
                    })
                    .foregroundColor(.black)
                    .alignmentGuide(.trailing) { d in d[.trailing] }
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 20,
                    alignment: .topTrailing
                )
                .onAppear(perform:  {
                    checkIsAddedToWIshList()
                })
                .padding()
            }

        }
    }

    @discardableResult
    private func checkIsAddedToWIshList() -> Bool {
        let status = wishListManager.checkStatus(id: self.product.id ?? "")
        self.isSelected = status
        return status
    }
}
