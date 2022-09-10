//
//  ErrorView.swift
//  ShoppingApp
//
//  Created by Mohammed Abdelaty on 10/09/2022.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    let error: String
    let relodData : () -> Void

    init(error: String, f: @escaping ()->()) {
        self.error = error
        self.relodData = f
    }

    var body: some View {
        Text(error)
            .multilineTextAlignment(.center)
            .font(.system(size: 20, weight: .bold, design: .default))
            .padding()
        Button(action:  {
            self.relodData()
        })  {
            Text("Rery")
                .fontWeight(.semibold)
                .font(.headline)
                .foregroundColor(.green)
                .padding()
                .frame(maxWidth: .infinity)
                .border(Color.green)
                .cornerRadius(5)
                .padding()
        }}
}
