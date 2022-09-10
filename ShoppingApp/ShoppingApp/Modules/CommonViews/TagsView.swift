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
        HStack {
            HStack( spacing: 5.0) {
                ForEach(tags ,id: \.self) { tag in
                    Text(tag)
                        .font(.custom(
                            "Roboto-Regular",
                            fixedSize: 12))
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.948))
                        .foregroundColor(.black)
                }
            }
            .padding(.leading, 5.0)
            HStack{
                Button(action: {
                    // Do something...
                }, label: {
                    Image(systemName: "bookmark")
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
