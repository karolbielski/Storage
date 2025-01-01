//
//  StorageItemTypePicker.swift
//  Storage
//
//  Created by Karol Bielski on 02/01/2025.
//

import SwiftUI

struct StorageItemTypePicker: View {
    @Binding var type: StorageItemType
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(StorageItemType.allCases) { type in
                    Button {
                        self.type = type
                    } label: {
                        Label {
                            Text(type.name)
                        } icon: {
                            type.image
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(
                        type == self.type ? Color.purple : Color.black
                    )
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    @Previewable @State var type: StorageItemType = .food
    StorageItemTypePicker(type: $type)
}
