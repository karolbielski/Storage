//
//  QuantityButtonStyle.swift
//  Storage
//
//  Created by Karol Bielski on 07/01/2025.
//

import SwiftUI

struct QuantityButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 20, height: 20)
            .padding(10)
            .foregroundStyle(Color.black)
            .background(
                configuration.isPressed
                    ? Circle()
                        .fill(Color.yellow.opacity(0.3))
                    : Circle()
                        .fill(Color.yellow)
            )
            .animation(
                configuration.isPressed
                    ? .easeInOut(duration: 0.05)
                    : .easeInOut(duration: 0.25).delay(0.1),
                value: configuration.isPressed
            )
    }
}
