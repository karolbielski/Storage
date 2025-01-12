//
//  QuantityDecreaseButton.swift
//  Storage
//
//  Created by Karol Bielski on 07/01/2025.
//

import SwiftUI

struct QuantityDecreaseButton: View {
    @Binding var quantity: Int
    let lowestQuantity: Int

    var body: some View {
        Button {
            quantity -= 1
        } label: {
            Image(systemName: "minus")
        }
        .buttonStyle(QuantityButtonStyle())
        .disabled(quantity <= lowestQuantity)
    }
}

#Preview("Enabled") {
    @Previewable @State var quantity = 1
    QuantityDecreaseButton(quantity: $quantity, lowestQuantity: 0)
}

#Preview("Disabled") {
    @Previewable @State var quantity = 0
    QuantityDecreaseButton(quantity: $quantity, lowestQuantity: 0)
}
