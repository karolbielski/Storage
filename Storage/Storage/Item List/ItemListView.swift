//
//  ItemListView.swift
//  Storage
//
//  Created by Karol Bielski on 03/01/2025.
//

import SwiftUI

struct ItemListView: View {

    @Binding var items: [StorageItem]

    var body: some View {
        let typedItems = Dictionary(grouping: items, by: { $0.type })
        let types = Array(typedItems.keys).sorted { $0.name < $1.name }

        List(types) { type in
            if let items = typedItems[type] {
                Section {
                    ForEach(items) { item in
                        ItemRowView(item: item)
                    }
                } header: {
                    Text(type.name)
                }
            }
        }
    }
}

#Preview {
    ItemListView(
        items: .constant([
            StorageItem(name: "Carrot", quantity: 10, type: .food),
            StorageItem(name: "Bread", quantity: 1, type: .food),
            StorageItem(name: "Hammer", quantity: 1, type: .tools),
            StorageItem(name: "Screwdriver", quantity: 2, type: .tools),
            StorageItem(name: "Keyboard", quantity: 1, type: .electronics)
        ])
    )
}
