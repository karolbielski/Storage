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
            StorageItemView(viewModel: viewModel)
                .padding(20)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        VStack {
                            Button("Remove") {
                                if let index = items.firstIndex(of: item) {
                                    items.remove(at: index)
                                }
                                selectedItem = nil
                            }
                            Button("Save") {
                                if let index = items.firstIndex(of: item) {
                                    items[index] = viewModel.item
                                }
                                selectedItem = nil
                            }
                        }
                    }
                }
                .presentationDetents([.medium])
        }
        .sheet(isPresented: $isNewItemViewPresented) {
            let viewModel = StorageItemViewModel()
            StorageItemView(viewModel: viewModel)
                .padding(20)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Create") {
                            items.append(viewModel.item)
                            isNewItemViewPresented = false
                        }
                    }
                }
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    ContentView()
}
