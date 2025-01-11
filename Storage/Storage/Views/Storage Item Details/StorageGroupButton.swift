//
//  StorageGroupButton.swift
//  Storage
//
//  Created by Karol Bielski on 11/01/2025.
//

import SwiftUI

struct StorageGroupButton: View {
    
    @Binding var group: StorageGroup
    @State private var isPickerViewVisible = false
    
    var body: some View {
        Button {
            isPickerViewVisible = true
        } label: {
            Image(systemName: group.imageSystemName)
                .foregroundStyle(Color.black)
        }
        .sheet(isPresented: $isPickerViewVisible) {
            StorageGroupPicker(group: $group)
                .padding(.vertical, 10)
                .presentationDetents([.medium])
        }
        .onChange(of: group) {
            isPickerViewVisible = false
        }
    }
}

#Preview {
    @Previewable @State var group = StorageGroup.other
    StorageGroupButton(group: $group)
}
