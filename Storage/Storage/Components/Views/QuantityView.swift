//
//  QuantityView.swift
//  Storage
//
//  Created by Karol Bielski on 08/01/2025.
//

import SwiftUI

struct QuantityView: View {
    @Binding var quantity: Int
    @Binding var minimalQuantity: Int
    @State private var fraction: CGFloat = 0

    var body: some View {
        VStack {
            HStack {
                QuantityDecreaseButton(quantity: $minimalQuantity)
                ZStack(alignment: .leading) {
                    QuantityBar(fraction: fraction)
                    Text("\(quantity) / \(minimalQuantity)")
                        .padding(.horizontal, 10)
                }
                QuantityIncreaseButton(quantity: $minimalQuantity)
            }
            HStack {
                QuantityDecreaseButton(quantity: $quantity)
                QuantityIncreaseButton(quantity: $quantity)
            }
        }
        .onChange(of: quantity, updateFraction)
        .onChange(of: minimalQuantity, updateFraction)
    }
    
    private func updateFraction() {
        withAnimation {
            if quantity <= 0 || minimalQuantity <= 0 {
                fraction = 0
            } else {
                fraction = CGFloat(quantity) / CGFloat(minimalQuantity)
            }
        }
    }
}

#Preview {
    @Previewable @State var quantity: Int = 0
    @Previewable @State var minimalQuantity: Int = 0
    QuantityView(
        quantity: $quantity,
        minimalQuantity: $minimalQuantity
    )
}
