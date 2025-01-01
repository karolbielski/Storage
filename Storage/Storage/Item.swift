//
//  Item.swift
//  Storage
//
//  Created by Karol Bielski on 01/01/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
