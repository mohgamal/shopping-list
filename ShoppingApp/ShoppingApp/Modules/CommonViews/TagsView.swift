//
//  TagsView.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import SwiftUI

struct TagsView: View {
    let tags: [String]
    let viewType: ViewType
    let itemId: String

    init (tags: [String], viewType: ViewType, itemId: String) {
        self.tags = tags
        self.viewType = viewType
        self.itemId = itemId
    }
    var body: some View {
        HStack {
            HStack( spacing: 5.0) {
                ForEach(tags ,id: \.self) { tag in
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
                        // Do something...
                    }, label: {
                        Image(systemName: Utils.checkItemStatus(itemId: self.itemId) ? "bookmark.fill" : "bookmark")
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
