//
//  StorageGroup+UI.swift
//  Storage
//
//  Created by Karol Bielski on 02/01/2025.
//

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

    var imageSystemName: String {
        switch self {
        case .food:
            "carrot"
        case .clothing:
            "hanger"
        case .electronics:
            "bolt"
        case .tools:
            "hammer"
        case .homeUtensils:
            "fork.knife"
        case .medicine:
            "syringe"
        case .other:
            "square"
        }
    }
}
