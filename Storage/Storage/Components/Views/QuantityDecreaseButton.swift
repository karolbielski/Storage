//
//  QuantityDecreaseButton.swift
//  Storage
//
//  Created by Karol Bielski on 07/01/2025.
//

import SwiftUI

struct QuantityDecreaseButton: View {
    @Binding var quantity: Int
    
    var body: some View {
        Button {
            quantity -= 1
        } label: {
            Image(systemName: "minus")
        }
        .buttonStyle(QuantityButtonStyle())
    }
}

#Preview {
    @Previewable @State var quantity = 0
    QuantityDecreaseButton(quantity: $quantity)
}
