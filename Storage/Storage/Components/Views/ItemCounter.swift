//
//  ItemCounter.swift
//  Storage
//
//  Created by Karol Bielski on 07/01/2025.
//

import SwiftUI

struct ItemCounter<Label>: View where Label: View {
    @Binding var quantity: Int
    @ViewBuilder var labelView: () -> Label
    
    var body: some View {
        HStack(spacing: 20) {
            QuantityDecreaseButton(quantity: $quantity, lowestQuantity: 0)
                .font(.title)
                .frame(maxWidth: .infinity)
            labelView()
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
            QuantityIncreaseButton(quantity: $quantity)
                .font(.title)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    @Previewable @State var quantity = 0
    ItemCounter(quantity: $quantity) {
        Text("\(quantity)")
            .font(.largeTitle)
    }
}
