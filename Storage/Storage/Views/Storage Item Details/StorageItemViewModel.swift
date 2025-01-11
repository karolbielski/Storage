//
//  StorageItemViewModel.swift
//  Storage
//
//  Created by Karol Bielski on 05/01/2025.
//

import Foundation

final class StorageItemViewModel: ObservableObject {
    @Published var name: String
    @Published var quantity: Int
    @Published var group: StorageGroup
    @Published var hasMinimalAmount: Bool

    @Published var minimalQuantity: Int {
        didSet {
            if minimalQuantity == 0 {
                hasMinimalAmount = false
                minimalQuantity = StorageItem.defaultMinimalQuantity
            }
        }
    }

    var item: StorageItem {
        StorageItem(
            name: name,
            quantity: quantity,
            minimalQuantity: minimalQuantity,
            group: group
        )
    }
    
    init(item: StorageItem) {
        name = item.name
        quantity = item.quantity
        minimalQuantity = item.minimalQuantity
        group = item.group
        hasMinimalAmount = item.minimalQuantity > StorageItem.defaultMinimalQuantity
    }
    
    convenience init() {
        self.init(
            item: StorageItem(
                name: "",
                quantity: StorageItem.defaultQuantity,
                minimalQuantity: StorageItem.defaultMinimalQuantity,
                group: .other
            )
        )
    }
}
