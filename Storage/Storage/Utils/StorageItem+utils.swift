//
//  StorageItem+utils.swift
//  Storage
//
//  Created by Karol Bielski on 04/01/2025.
//

import Foundation

extension Array where Element == StorageItem {
    var grouped: Dictionary<StorageGroup, [StorageItem]> {
        Dictionary(grouping: self, by: { $0.group })
    }
}
