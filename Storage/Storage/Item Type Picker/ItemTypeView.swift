//
//  ItemTypeView.swift
//  Storage
//
//  Created by Karol Bielski on 03/01/2025.
//

import SwiftUI

struct ItemTypeView: View {
    let type: StorageItemType
    let isSelected: Bool

    var body: some View {
        Label {
            Text(type.name)
        } icon: {
            type.image
        }
        .foregroundStyle(
            isSelected ? Color.purple : Color.black
        )
    }
}

#Preview("Unselected") {
    ItemTypeView(
        type: .food,
        isSelected: false
    )
}

#Preview("Selected") {
    ItemTypeView(
        type: .food,
        isSelected: true
    )
}
