//
//  StorageItemListView.swift
//  Storage
//
//  Created by Karol Bielski on 03/01/2025.
//

import SwiftUI

struct StorageItemListView: View {

    @Binding var items: [StorageItem]

    var body: some View {
        let groupedItems = Dictionary(grouping: items, by: { $0.group })
        let groups = Array(groupedItems.keys).sorted { $0.name < $1.name }

        List(groups) { group in
            if let items = groupedItems[group] {
                Section {
                    ForEach(items) { item in
                        StorageItemRowView(item: item)
                    }
                } header: {
                    Text(group.name)
                }
            }
        }
    }
}

#Preview {
    StorageItemListView(
        items: .constant([
            StorageItem(name: "Carrot", quantity: 10, group: .food),
            StorageItem(name: "Bread", quantity: 1, group: .food),
            StorageItem(name: "Hammer", quantity: 1, group: .tools),
            StorageItem(name: "Screwdriver", quantity: 2, group: .tools),
            StorageItem(name: "Keyboard", quantity: 1, group: .electronics)
        ])
    )
}
