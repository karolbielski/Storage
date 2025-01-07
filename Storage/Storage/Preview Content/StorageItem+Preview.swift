//
//  StorageItem+Preview.swift
//  Storage
//
//  Created by Karol Bielski on 04/01/2025.
//

import Foundation

extension StorageItem {
    static let carrotPreview = StorageItem(
        name: "Carrot",
        quantity: 1,
        minimalQuantity: 5,
        group: .food
    )

    static let hammerPreview = StorageItem(
        name: "Hammer",
        quantity: 2,
        minimalQuantity: 2,
        group: .tools
    )

    static let breadPreview = StorageItem(
        name: "Bread",
        quantity: 5,
        minimalQuantity: 5,
        group: .food
    )
    
    static let screwdriverPreview = StorageItem(
        name: "Screwdriver",
        quantity: 2,
        minimalQuantity: 8,
        group: .tools
    )
    
    static let keyboardPreview = StorageItem(
        name: "Keyboard",
        quantity: 1,
        minimalQuantity: 1,
        group: .electronics
    )
}
