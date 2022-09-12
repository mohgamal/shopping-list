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

    init(vm: ProductDetailsViewModel) {
        self.vm = vm
    }

    var btnBack : some View { Button(action: {
           self.presentationMode.wrappedValue.dismiss()
           }) {
               HStack {
               Image(systemName: "arrow.left")
                    .resizable()
                   .aspectRatio(contentMode: .fit)
                   .foregroundColor(.black)
                   .frame(width: 25, height: 25)
               }
           }
       }

    var body: some View {
        ScrollView {
            ProductCell(item: vm.product,
                        currency: vm.currency,
                        viewType: .details)
                Button(action:  {
                    vm.addToCart()
                })  {
                    Text("ADD TO BAG")
                        .fontWeight(.semibold)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background( self.vm.isAddedToCart ? Color.gray : Color.black)
                        .cornerRadius(5)
                        .padding()
                }
                .disabled(self.vm.isAddedToCart)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .toolbar {
                Button(action: {
                    vm.addToWishList()
                }, label: {
                    Image(systemName: vm.isAddedToWishList ? "bookmark.fill": "bookmark")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
                .foregroundColor(.black)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

enum ViewType {
    case cell
    case details
}
