//
//  StorageGroupRow.swift
//  Storage
//
//  Created by Karol Bielski on 03/01/2025.
//

import SwiftUI

struct StorageGroupRow: View {
    let group: StorageGroup
    let isSelected: Bool

    var body: some View {
        Label {
            Text(group.name)
        } icon: {
            group.image
        }
        .foregroundStyle(
            isSelected ? Color.purple : Color.black
        )
    }
}

#Preview("Unselected") {
    StorageGroupRow(
        group: .food,
        isSelected: false
    )
}

#Preview("Selected") {
    StorageGroupRow(
        group: .food,
        isSelected: true
    )
}
