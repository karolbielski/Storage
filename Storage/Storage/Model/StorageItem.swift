//
//  StorageItem.swift
//  Storage
//
//  Created by Karol Bielski on 02/01/2025.
//

import Foundation

struct StorageItem: Identifiable {
    let id = UUID()
    let name: String
    let quantity: Int
    let group: StorageGroup
}
