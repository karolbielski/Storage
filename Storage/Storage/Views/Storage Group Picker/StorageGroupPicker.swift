//
//  StorageGroupPicker.swift
//  Storage
//
//  Created by Karol Bielski on 02/01/2025.
//

import SwiftUI

struct StorageGroupPicker: View {
    @Binding var group: StorageGroup

    var body: some View {
        List(StorageGroup.allCases) { group in
            Button {
                self.group = group
            } label: {
                StorageGroupRow(
                    group: group,
                    isSelected: self.group == group
                )
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    @Previewable @State var group: StorageGroup = .food
    StorageGroupPicker(group: $group)
}
