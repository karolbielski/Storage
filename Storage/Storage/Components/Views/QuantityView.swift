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
    @State private var isMinimalQuantityChangeViewVisible = false

    var body: some View {
        HStack {
            ZStack(alignment: .center) {
                QuantityBar(fraction: fraction)
                Text("\(minimalQuantity)")
                    .font(.title3)
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 10)
            }
            .onTapGesture {
                withAnimation {
                    isMinimalQuantityChangeViewVisible.toggle()
                }
            }
            if isMinimalQuantityChangeViewVisible {
                QuantityDecreaseButton(quantity: $minimalQuantity, lowestQuantity: 0)
                QuantityIncreaseButton(quantity: $minimalQuantity)
            }
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
    @Previewable @State var minimalQuantity = 1
    QuantityView(quantity: 1, minimalQuantity: $minimalQuantity)
}
