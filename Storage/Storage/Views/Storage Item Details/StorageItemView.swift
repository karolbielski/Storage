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
            propertiesView
            itemCounterView
            minimalAmountView
            Spacer()
        }
    }
    
    @ViewBuilder private var propertiesView: some View {
        HStack {
            TextField("Name", text: $viewModel.name)
            StorageGroupButton(group: $viewModel.group)
        }
    }
    
    @ViewBuilder private var itemCounterView: some View {
        ItemCounter(quantity: $viewModel.quantity)
    }
    
    @ViewBuilder private var minimalAmountView: some View {
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
    }
}

#Preview {
    StorageItemView(viewModel: StorageItemViewModel())
}
