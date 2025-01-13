//
//  QuantityBar.swift
//  Storage
//
//  Created by Karol Bielski on 08/01/2025.
//

import SwiftUI

struct QuantityBar: View {
    let fraction: CGFloat

    private var normalizedFraction: CGFloat {
        max(0, min(1, fraction))
    }

    private var color: Color {
        if normalizedFraction == 1.0 {
            .green
        } else {
            .purple
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.secondary.opacity(0.5))
                Rectangle()
                    .fill(color.opacity(0.5))
                    .frame(width: geometry.size.width * normalizedFraction)
            }
        }
        .frame(height: 50)
        .cornerRadius(10)
    }
}

#Preview("0.4") {
    QuantityBar(fraction: 0.4)
}

#Preview("1.0") {
    QuantityBar(fraction: 1.0)
}

#Preview("-0.4") {
    QuantityBar(fraction: -0.4)
}

#Preview("4.0") {
    QuantityBar(fraction: 4.0)
}
