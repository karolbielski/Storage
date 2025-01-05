//
//  ContentView.swift
//  Storage
//
//  Created by Karol Bielski on 01/01/2025.
//

import SwiftUI

struct ContentView: View {

    @State private var items: [StorageItem] = []
    @State private var isNewItemViewPresented = false

    var body: some View {
        NavigationStack {
            StorageItemList(items: $items)
                .navigationTitle("Storage")
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
        .sheet(isPresented: $isNewItemViewPresented) {
            NewStorageItemView { item in
                items.append(item)
                isNewItemViewPresented = false
            }
            .padding(20)
            .presentationDetents([.medium])
        }
    }
}

#Preview {
    ContentView()
}
