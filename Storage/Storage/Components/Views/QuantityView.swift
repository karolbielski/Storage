//
//  QuantityView.swift
//  Storage
//
//  Created by Karol Bielski on 08/01/2025.
//

import SwiftUI

struct QuantityView: View {
    let quantity: Int
    @Binding var minimalQuantity: Int
    @State private var fraction: CGFloat = 0

    var body: some View {
        HStack {
            QuantityDecreaseButton(quantity: $minimalQuantity)
            ZStack(alignment: .leading) {
                QuantityBar(fraction: fraction)
                Text("\(quantity) / \(minimalQuantity)")
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 10)
            }
            QuantityIncreaseButton(quantity: $minimalQuantity)
        }
        .onAppear(perform: updateFraction)
        .onChange(of: quantity) {
            withAnimation {
                updateFraction()
            }
        }
        .onChange(of: minimalQuantity) {
            withAnimation {
                updateFraction()
            }
        }
    }

    private func updateFraction() {
        if quantity <= 0 || minimalQuantity <= 0 {
            fraction = 0
        } else {
            fraction = CGFloat(quantity) / CGFloat(minimalQuantity)
        }
    }
}

#Preview {
    @Previewable @State var minimalQuantity: Int = 1
    QuantityView(
        quantity: 1,
        minimalQuantity: $minimalQuantity
    )
}
