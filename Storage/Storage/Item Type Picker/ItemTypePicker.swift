//
//  ItemTypePicker.swift
//  Storage
//
//  Created by Karol Bielski on 02/01/2025.
//

import SwiftUI

struct ItemTypePicker: View {
    @Binding var type: StorageItemType

    var body: some View {
        List(StorageItemType.allCases) { type in
            Button {
                self.type = type
            } label: {
                ItemTypeView(
                    type: type,
                    isSelected: self.type == type
                )
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    @Previewable @State var type: StorageItemType = .food
    ItemTypePicker(type: $type)
}
