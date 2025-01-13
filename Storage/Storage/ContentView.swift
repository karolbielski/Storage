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
            editItemView(item)
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $isNewItemViewPresented) {
            newItemView()
                .presentationDetents([.medium])
        }
    }

    @ViewBuilder private func editItemView(_ item: StorageItem) -> some View {
        let viewModel = StorageItemViewModel(item: item)
        NavigationStack {
            StorageItemView(viewModel: viewModel)
                .padding(20)
                .navigationTitle("Edit \(item.name)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Remove") {
                            if let index = items.firstIndex(of: item) {
                                items.remove(at: index)
                            }
                            selectedItem = nil
                        }
                        .buttonStyle(DestructiveButtonStyle())
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Save") {
                            if let index = items.firstIndex(of: item) {
                                items[index] = viewModel.item
                            }
                            selectedItem = nil
                        }
                        .buttonStyle(ConfirmButtonStyle())
                    }
                }
        }
    }

    @ViewBuilder private func newItemView() -> some View {
        let viewModel = StorageItemViewModel()
        NavigationStack {
            StorageItemView(viewModel: viewModel)
                .padding(20)
                .navigationTitle("New item")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Create") {
                            items.append(viewModel.item)
                            isNewItemViewPresented = false
                        }
                        .buttonStyle(ConfirmButtonStyle())
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
