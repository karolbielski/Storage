//
//  NewStorageItemView.swift
//  Storage
//
//  Created by Karol Bielski on 01/01/2025.
//

import SwiftUI

struct NewStorageItemView: View {
    let onCreated: (StorageItem) -> Void
    @State private var name = ""
    @State private var quantity = 0
    @State private var group: StorageGroup = .other
    @State private var isGroupPickerVisible = false

    var body: some View {
        VStack {
            TextField("Name", text: $name)
            Stepper(value: $quantity, in: 0...1000, step: 1) {
                Text("\(quantity)")
            }
            Button {
                isGroupPickerVisible = true
            } label: {
                StorageGroupView(group: group, isSelected: false)
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Create") {
                    let item = createItem()
                    onCreated(item)
                }
            }
        }
        .sheet(isPresented: $isGroupPickerVisible) {
            StorageGroupPicker(group: $group)
                .padding(.vertical, 10)
                .presentationDetents([.medium])
        }
        .onChange(of: group) {
            isGroupPickerVisible = false
        }
    }

    private func createItem() -> StorageItem {
        let item = StorageItem(
            name: name,
            quantity: quantity,
            group: group
        )
        return item
    }
}

#Preview {
    NewStorageItemView { _ in }
}
