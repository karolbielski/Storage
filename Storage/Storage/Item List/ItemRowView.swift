//
//  ItemRowView.swift
//  Storage
//
//  Created by Karol Bielski on 03/01/2025.
//

import SwiftUI

struct ItemRowView: View {
    
    let item: StorageItem
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Text("\(item.quantity)")
        }
    }
}

#Preview {
    ItemRowView(item: StorageItem(name: "Carrot", quantity: 1, type: .food))
}
