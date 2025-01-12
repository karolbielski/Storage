//
//  QuantityBar.swift
//  Storage
//
//  Created by Karol Bielski on 08/01/2025.
//

import SwiftUI

struct QuantityBar: View {
    let fraction: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.secondary.opacity(0.5))
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: geometry.size.width * fraction.normalized)
            }
        }
        .frame(height: 50)
        .cornerRadius(10)
    }
}

#Preview {
    QuantityBar(fraction: 0.4)
}

private extension CGFloat {
    var normalized: CGFloat {
        return if self > 1 {
            1
        } else if self < 0 {
            0
        } else {
            self
        }
    }
}
