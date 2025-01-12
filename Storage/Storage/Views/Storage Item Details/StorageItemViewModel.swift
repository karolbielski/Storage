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
    @Published var minimalQuantity: Int

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
