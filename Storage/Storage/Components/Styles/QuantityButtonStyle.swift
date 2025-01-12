//
//  QuantityButtonStyle.swift
//  Storage
//
//  Created by Karol Bielski on 07/01/2025.
//

import SwiftUI

struct QuantityButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 20, height: 20)
            .padding(10)
            .fontWeight(.bold)
            .foregroundStyle(
                isEnabled
                    ? (configuration.isPressed
                        ? Color.purple.opacity(0.3)
                        : Color.purple)
                    : Color.gray
            )
            .animation(
                configuration.isPressed
                    ? .easeInOut(duration: 0.05)
                    : .easeInOut(duration: 0.25).delay(0.1),
                value: configuration.isPressed
            )
    }
}
