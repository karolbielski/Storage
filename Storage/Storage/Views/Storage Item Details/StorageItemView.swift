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
            ItemCounter(quantity: $viewModel.quantity)
            if viewModel.hasMinimalAmount {
                QuantityView(
                    quantity: viewModel.quantity,
                    minimalQuantity: $viewModel.minimalQuantity
                )
            } else {
                Button {
                    viewModel.hasMinimalAmount = true
                } label: {
                    Text("Set minimal amount")
                }
            }
            Spacer()
        }
        .sheet(isPresented: $viewModel.isGroupPickerVisible) {
            StorageGroupPicker(group: $viewModel.group)
                .padding(.vertical, 10)
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    StorageItemView(viewModel: StorageItemViewModel())
}
