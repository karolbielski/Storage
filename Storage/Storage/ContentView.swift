//
//  ContentView.swift
//  Storage
//
//  Created by Karol Bielski on 01/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [StorageItem] = []
    @State private var selectedItem: StorageItem?
    @State private var isNewItemViewPresented = false

    var body: some View {
        NavigationStack {
            Group {
                if items.isEmpty {
                    Text("No items\nAdd new item by + button")
                        .multilineTextAlignment(.center)
                } else {
                    StorageItemList(
                        items: $items,
                        selectedItem: $selectedItem
                    )
                }
            }
            .navigationTitle("Storage")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isNewItemViewPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(item: $selectedItem) { item in
            let viewModel = StorageItemViewModel(item: item)
            VStack(spacing: 20) {
                StorageItemView(viewModel: viewModel)
                HStack(spacing: 20) {
                    Button("Remove") {
                        if let index = items.firstIndex(of: item) {
                            items.remove(at: index)
                        }
                        selectedItem = nil
                    }
                    .buttonStyle(DestructiveButtonStyle())
                    Button("Save") {
                        if let index = items.firstIndex(of: item) {
                            items[index] = viewModel.item
                        }
                        selectedItem = nil
                    }
                    .buttonStyle(ConfirmButtonStyle())
                }
            }
            .padding(20)
            .presentationDetents([.fraction(0.4)])
        }
        .sheet(isPresented: $isNewItemViewPresented) {
            let viewModel = StorageItemViewModel()
            VStack(spacing: 20) {
                StorageItemView(viewModel: viewModel)
                Button("Create") {
                    items.append(viewModel.item)
                    isNewItemViewPresented = false
                }
                .buttonStyle(ConfirmButtonStyle())
            }
            .padding(20)
            .presentationDetents([.fraction(0.4)])
        }
    }
}

#Preview {
    ContentView()
}
