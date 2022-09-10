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
    let product: ProductModel
    let currency: String

    init(product: ProductModel, currency: String) {
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
        ProductCell(item: product, currency: currency, viewType: .details)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .toolbar {
                Button(action: {
                    // Do something...
                }, label: {
                    Image(systemName: "bookmark")
                })
                .foregroundColor(.black)
            }
    }

    private func addToWishList() {
        
    }
}

enum ViewType {
    case cell
    case details
}
