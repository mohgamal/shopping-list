//
//  ProductDetailsView.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation
import SwiftUI

struct ProductDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject public var vm: ProductDetailsViewModel

    let product: ProductModel
    let currency: String


    init(vm: ProductDetailsViewModel, product: ProductModel, currency: String) {
        self.vm = vm
        self.product = product
        self.currency = currency
    }

    var btnBack : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
               Image(systemName: "arrow.left") // set image here
                   .aspectRatio(contentMode: .fit)
                   .foregroundColor(.black)
               }
           }
       }

    var body: some View {
        ScrollView {
            ProductCell(item: product,
                        currency: currency,
                        viewType: .details,
                        wishListManager: vm.wishListManager,
                        cartManager: vm.cartManager)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .toolbar {
                Button(action: {
                    vm.isAddedToWishList.toggle()
                    vm.wishListManager.add(product: product)
                    vm.checkIsAddedToWIshList(itemId: self.product.id ?? "")
                }, label: {
                    Image(systemName: vm.isAddedToWishList ? "bookmark.fill": "bookmark")
                })
                .foregroundColor(.black)
            }
        }
        .padding()
        .onAppear(perform: {
            vm.checkIsAddedToWIshList(itemId: self.product.id ?? "")
        })
        .frame(maxWidth: .infinity)
    }
}

enum ViewType {
    case cell
    case details
}
