//
//  StorageItemRow.swift
//  Storage
//
//  Created by Karol Bielski on 03/01/2025.
//

import SwiftUI

struct StorageItemRow: View {
    
    let item: StorageItem
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Text("\(item.quantity) / \(item.minimalQuantity)")
        }
    }
}

#Preview {
    StorageItemRow(item: .carrotPreview)
}
