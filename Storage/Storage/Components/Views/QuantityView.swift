//
//  QuantityView.swift
//  Storage
//
//  Created by Karol Bielski on 08/01/2025.
//

import SwiftUI

struct QuantityView: View {
    @Binding var quantity: Int
    @Binding var desiredQuantity: Int
    @State private var fraction: CGFloat = 0
    
    var body: some View {
        VStack {
            HStack {
                QuantityDecreaseButton(quantity: $quantity)
                ZStack(alignment: .leading) {
                    QuantityBar(fraction: fraction)
                    Text("\(quantity)")
                        .padding(.horizontal, 10)
                }
                QuantityIncreaseButton(quantity: $quantity)
            }
            ItemCounter(quantity: $desiredQuantity)
        }
        .onChange(of: quantity) { oldValue, newValue in
            guard newValue > 0 else {
                fraction = 0
                return
            }
            withAnimation {
                fraction = CGFloat(newValue) / CGFloat(desiredQuantity)
            }
        }
        .onChange(of: desiredQuantity) { oldValue, newValue in
            guard newValue > 0 else {
                fraction = 0
                return
            }
            withAnimation {
                fraction = CGFloat(quantity) / CGFloat(newValue)
            }
        }
    }
}

#Preview {
    @Previewable @State var quantity: Int = 0
    @Previewable @State var desiredQuantity: Int = 0
    QuantityView(
        quantity: $quantity,
        desiredQuantity: $desiredQuantity
    )
}
