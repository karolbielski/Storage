//
//  DestructiveButtonStyle.swift
//  Storage
//
//  Created by Karol Bielski on 12/01/2025.
//

import SwiftUI

struct DestructiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(10)
            .fontWeight(.bold)
            .foregroundStyle(
                configuration.isPressed
                    ? Color.white.opacity(0.3)
                    : Color.white
            )
            .background(Color.red)
            .cornerRadius(10)
            .animation(
                configuration.isPressed
                    ? .easeInOut(duration: 0.05)
                    : .easeInOut(duration: 0.25).delay(0.1),
                value: configuration.isPressed
            )
    }
}
