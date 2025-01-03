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
        List(items) { item in
            ItemRowView(item: item)
        }
    }
}

#Preview {
    ItemListView(
        items: .constant([
            StorageItem(name: "Carrot", quantity: 1, type: .food),
            StorageItem(name: "Hammer", quantity: 10, type: .tools),
        ])
    )
}
