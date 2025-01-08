//
//  ItemCounter.swift
//  Storage
//
//  Created by Karol Bielski on 07/01/2025.
//

import SwiftUI

struct ItemCounter: View {
    @Binding var quantity: Int
    
    var body: some View {
        HStack(spacing: 20) {
            if quantity > 0 {
                QuantityDecreaseButton(quantity: $quantity)
            }
            Text("\(quantity)")
            QuantityIncreaseButton(quantity: $quantity)
        }
    }
}

#Preview {
    @Previewable @State var quantity = 0
    ItemCounter(quantity: $quantity)
}
