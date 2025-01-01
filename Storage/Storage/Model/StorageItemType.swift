//
//  StorageItemType.swift
//  Storage
//
//  Created by Karol Bielski on 02/01/2025.
//

import Foundation

enum StorageItemType: Int, Identifiable, CaseIterable {
    case food
    case clothing
    case electronics
    case tools
    case homeUtensils
    case medicine
    case other

    var id: Int {
        rawValue
    }
}
