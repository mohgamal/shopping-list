//
//  TagsView.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import SwiftUI

struct TagsView: View {
    var tags: [String]
    init (tags: [String]) {
        self.tags = tags
    }
    var body: some View {
        HStack( spacing: 3) {
            ForEach(tags ,id: \.self) { tag in
                Text(tag)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
                    .frame(height: 20, alignment: .center)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.948))
                    .foregroundColor(.black)
                    .font(.custom(
                        "Roboto-Regular",
                        fixedSize: 12))
                    .frame(alignment: .leading)
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: 20,
            alignment: .topLeading
        )
        .padding()
    }
}
