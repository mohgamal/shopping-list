//
//  ProductListView.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 08/09/2022.
//

import Foundation
import SwiftUI

struct ProductListView: View {
    var appDI: AppDIInterface
    @ObservedObject public var vm: ProductListViewModel
    @State private var isPresented = false

    init (appDI: AppDIInterface, vm: ProductListViewModel) {
        self.appDI = appDI
        self.vm = vm
    }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                if let error = vm.error {
                    ErrorView(error: error.localizedDescription, f: self.reloadData)
                } else {
                    LazyVGrid(columns:  columns, spacing: 20) {
                        ForEach(vm.productResult?.items ?? [], id: \.id) { item in
                            NavigationLink(destination: ProductDetailsView(vm: appDI.productDetailsDependecies(product: item, currency: vm.productResult?.currency ?? "" ))) {
                                ProductCell(item: item,
                                            currency: vm.productResult?.currency ?? "",
                                            viewType: .cell)
                                .frame(height: 320)
                            }
                        }
                    }.padding()
                        .toolbar {
                            Button(action: {
                                isPresented.toggle()
                            }, label: {
                                Image(systemName:  "bookmark")
                                    .resizable()
                                    .frame(width: 25, height:25)
                            })
                            .fullScreenCover(isPresented: $isPresented, content: {
                                WishListView(vm: appDI.wishListDependecies(), currency: vm.productResult?.currency ?? "")
                            })

                            .foregroundColor(.black)
                        }
                        .navigationBarTitle(vm.productResult?.title ?? "", displayMode: .inline)
                        .background(NavigationConfigurator { nc in
                            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
                        })
                }
            }
            .frame(maxWidth: .infinity)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.002, brightness: 0.944)/*@END_MENU_TOKEN@*/)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            reloadData()
        }
    }

    func reloadData() {
        self.vm.error = nil
        self.vm.getData()
    }
}
