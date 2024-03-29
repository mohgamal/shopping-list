//
//  WishListView.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation
import SwiftUI

struct WishListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject public var vm: WishListViewModel
    let currency: String

    init (vm: WishListViewModel, currency: String) {
        self.vm = vm
        self.currency = currency
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(vm.wishList, id: \.id) { product in
                        VStack {
                            WishListProductCell(product: product, currency: currency)
                            Button(action: {
                                vm.removeProductFromWishList(id: product.id ?? "")
                            }, label: {
                                Image(systemName:  "trash")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("Remove")
                                    .underline()
                            })
                            .foregroundColor(.black)
                            Divider()
                        }
                    }
                }
                .toolbar {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName:  "xmark")
                            .resizable()
                            .frame(width: 25, height:25)
                    })

                    .foregroundColor(.black)
                }
                .navigationBarTitle( "WISHLIST (\(vm.wishList.count))", displayMode: .inline)
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
                })
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
