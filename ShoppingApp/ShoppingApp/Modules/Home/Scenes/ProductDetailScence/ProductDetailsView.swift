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
        Text ("view")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
    }
}
