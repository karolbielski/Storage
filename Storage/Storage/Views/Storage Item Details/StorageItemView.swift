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
            Spacer()
            quantityProgressView
            itemCounterView
        }
    }

    @ViewBuilder private var propertiesView: some View {
        HStack {
            TextField("Name", text: $viewModel.name)
            StorageGroupButton(group: $viewModel.group)
        }
    }

    @ViewBuilder private var quantityProgressView: some View {
        QuantityView(
            quantity: viewModel.quantity,
            minimalQuantity: $viewModel.minimalQuantity
        )
    }

    @ViewBuilder private var itemCounterView: some View {
        ItemCounter(quantity: $viewModel.quantity) {
            Text("\(viewModel.quantity)")
                .font(.largeTitle)
        }
    }
}

#Preview {
    StorageItemView(viewModel: StorageItemViewModel())
}
