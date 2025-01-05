//
//  StorageItemView.swift
//  Storage
//
//  Created by Karol Bielski on 01/01/2025.
//

import SwiftUI

struct StorageItemView: View {
    @ObservedObject var viewModel: StorageItemViewModel
    @State private var isGroupPickerVisible = false

    var body: some View {
        VStack {
            TextField("Name", text: $viewModel.name)
            Stepper(value: $viewModel.quantity, in: 0...1000, step: 1) {
                Text("\(viewModel.quantity)")
            }
            Button {
                isGroupPickerVisible = true
            } label: {
                StorageGroupRow(group: viewModel.group, isSelected: false)
            }
            Spacer()
        }
        .sheet(isPresented: $isGroupPickerVisible) {
            StorageGroupPicker(group: $viewModel.group)
                .padding(.vertical, 10)
                .presentationDetents([.medium])
        }
        .onChange(of: viewModel.group) {
            isGroupPickerVisible = false
        }
    }
}

#Preview {
    StorageItemView(viewModel: StorageItemViewModel())
}
