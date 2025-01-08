//
//  StorageItemViewModel.swift
//  Storage
//
//  Created by Karol Bielski on 05/01/2025.
//

import Foundation

final class StorageItemViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var quantity: Int = 0
    @Published var minimalQuantity: Int = 0
    @Published var group: StorageGroup = .other
    @Published var isGroupPickerVisible: Bool = false
    
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
                quantity: 0,
                minimalQuantity: 0,
                group: .other
            )
        )
    }
}
