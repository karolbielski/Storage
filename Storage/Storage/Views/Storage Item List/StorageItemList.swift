//
//  StorageItemList.swift
//  Storage
//
//  Created by Karol Bielski on 03/01/2025.
//

import SwiftUI

struct StorageItemList: View {

    @Binding var items: [StorageItem]
    @Binding var selectedItem: StorageItem?

    var body: some View {
        let groupedItems = items.grouped
        let groups = Array(groupedItems.keys).sorted { $0.name < $1.name }

        List(groups) { group in
            if let items = groupedItems[group] {
                Section {
                    ForEach(items) { item in
                        Button {
                            selectedItem = item
                        } label: {
                            StorageItemRow(item: item)
                        }
                        .buttonStyle(.plain)
                    }
                } header: {
                    Text(group.name)
                }
            }
        }
    }
}

#Preview {
    StorageItemList(
        items: .constant([
            .carrotPreview,
            .breadPreview,
            .hammerPreview,
            .screwdriverPreview,
            .keyboardPreview
        ]),
        selectedItem: .constant(nil)
    )
}
