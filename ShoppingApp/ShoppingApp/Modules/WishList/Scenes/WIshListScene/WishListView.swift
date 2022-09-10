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

    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 20, height:20)
                            .padding()

                    }
                }

                Spacer()
            }
        }
    }
}
