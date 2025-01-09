//
//  StorageItemView.swift
//  Storage
//
//  Created by Karol Bielski on 01/01/2025.
//

import SwiftUI

struct StorageItemView: View {
    @ObservedObject var viewModel: StorageItemViewModel

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                TextField("Name", text: $viewModel.name)
                Button {
                    viewModel.isGroupPickerVisible = true
                } label: {
                    Image(systemName: viewModel.group.imageSystemName)
                        .foregroundStyle(Color.black)
                }
            }
            QuantityView(
                quantity: $viewModel.quantity,
                minimalQuantity: $viewModel.minimalQuantity
            )
            Spacer()
        }
        .sheet(isPresented: $viewModel.isGroupPickerVisible) {
            StorageGroupPicker(group: $viewModel.group)
                .padding(.vertical, 10)
                .presentationDetents([.medium])
        }
        .onChange(of: viewModel.group) {
            viewModel.isGroupPickerVisible = false
        }
    }
}

#Preview {
    StorageItemView(viewModel: StorageItemViewModel())
}
