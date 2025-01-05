//
//  StorageItemList.swift
//  Storage
//
//  Created by Karol Bielski on 03/01/2025.
//

import SwiftUI

struct StorageItemList: View {

    @Binding var items: [StorageItem]

    var body: some View {
        let groupedItems = items.grouped
        let groups = Array(groupedItems.keys).sorted { $0.name < $1.name }

        List(groups) { group in
            if let items = groupedItems[group] {
                Section {
                    ForEach(items) { item in
                        StorageItemRow(item: item)
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
        ])
    )
}
