//
//  TagsView.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import SwiftUI

struct TagsView: View {
    @ObservedObject public var vm: TagsViewModel

    init (vm: TagsViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        HStack {
            HStack( spacing: 5.0) {
                ForEach(vm.product.badges ?? [] ,id: \.self) { tag in
                    Text(tag)
                        .font(.custom(
                            "Roboto-Regular",
                            fixedSize: FontStyleConstants.init(viewType: vm.viewType).subTitle))
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.948))
                        .foregroundColor(.black)
                }
            }
            .padding(.leading, 5.0)

            if vm.viewType == .cell {
                HStack{
                    Button(action: {
                        vm.addToWishList()
                    }, label: {
                        Image(systemName: self.vm.isAddedToWishList ? "bookmark.fill" : "bookmark")
                            .resizable()
                            .frame(width: 25, height: 25)
                    })
                    .foregroundColor(.black)
                    .alignmentGuide(.trailing) { d in d[.trailing] }
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: 20,
                    alignment: .topTrailing
                )
                .padding()
            }
        }
    }
}
