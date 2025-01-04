//
//  StorageGroup+UI.swift
//  Storage
//
//  Created by Karol Bielski on 02/01/2025.
//

import SwiftUI

extension StorageGroup {
    var name: String {
        switch self {
        case .food:
            "Food"
        case .clothing:
            "Clothing"
        case .electronics:
            "Electronics"
        case .tools:
            "Tools"
        case .homeUtensils:
            "Home utensils"
        case .medicine:
            "Medicine"
        case .other:
            "Other"
        }
    }

    var image: Image {
        switch self {
        case .food:
            Image(systemName: "carrot")
        case .clothing:
            Image(systemName: "hanger")
        case .electronics:
            Image(systemName: "bolt")
        case .tools:
            Image(systemName: "hammer")
        case .homeUtensils:
            Image(systemName: "fork.knife")
        case .medicine:
            Image(systemName: "syringe")
        case .other:
            Image(systemName: "square")
        }
    }
}
