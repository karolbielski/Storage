//
//  NewItemView.swift
//  Storage
//
//  Created by Karol Bielski on 01/01/2025.
//

import SwiftUI

struct NewItemView: View {
    let onCreated: (StorageItem) -> Void
    @State private var name = ""
    @State private var quantity = 0
    @State private var type: StorageItemType = .other
    @State private var isTypePickerVisible = false

    var body: some View {
        VStack {
            TextField("Name", text: $name)
            Stepper(value: $quantity, in: 0...1000, step: 1) {
                Text("\(quantity)")
            }
            Button {
                isTypePickerVisible = true
            } label: {
                ItemTypeView(type: type, isSelected: false)
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
        .sheet(isPresented: $isTypePickerVisible) {
            ItemTypePicker(type: $type)
                .padding(.vertical, 10)
                .presentationDetents([.medium])
        }
        .onChange(of: type) {
            isTypePickerVisible = false
        }
    }

    private func createItem() -> StorageItem {
        let item = StorageItem(
            name: name,
            quantity: quantity,
            type: type
        )
        return item
    }
}

#Preview {
    NewItemView { _ in }
}
