//
//  ProductImageView.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import SwiftUI

struct ProductImageView: View {
    @ObservedObject private var imageLoader: DataLoader
    let tags: [String]
    let imageURL: String
    let viewType: ViewType
    let itemId: String

    init (tags: [String], imageURL: String, viewType: ViewType, itemId: String) {
        self.tags = tags
        self.imageURL = imageURL
        self.viewType = viewType
        self.itemId = itemId
        imageLoader = DataLoader(resourseURL: URL(string:imageURL))
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            TagsView(tags: tags, viewType: viewType, itemId: self.itemId)
            
            if let uiImage = UIImage(data: imageLoader.data) {
                AnyView(Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame( alignment: .center)
                )

                .background(Color(UIColor.white))
            }
            else {
                AnyView(Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .center)
                    .onAppear(perform: { imageLoader.loadImage() }))
                .background(Color(UIColor.white))
            }
        }
        .frame(maxWidth: .infinity, minHeight: 200)
        .cornerRadius(20)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 1.0, saturation: 0.0, brightness: 1.0)/*@END_MENU_TOKEN@*/)
    }
}
