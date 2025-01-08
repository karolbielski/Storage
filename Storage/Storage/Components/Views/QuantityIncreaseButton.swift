//
//  QuantityIncreaseButton.swift
//  Storage
//
//  Created by Karol Bielski on 07/01/2025.
//

import SwiftUI

struct QuantityIncreaseButton: View {
    @Binding var quantity: Int
    
    var body: some View {
        Button {
            quantity += 1
        } label: {
            Image(systemName: "plus")
        }
        .buttonStyle(QuantityButtonStyle())
    }
}

#Preview {
    @Previewable @State var quantity = 0
    QuantityIncreaseButton(quantity: $quantity)
}
