//
//  StorageItem.swift
//  Storage
//
//  Created by Karol Bielski on 02/01/2025.
//

import Foundation

struct StorageItem: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var quantity: Int
    var group: StorageGroup
}
