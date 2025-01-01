//
//  ContentView.swift
//  Storage
//
//  Created by Karol Bielski on 01/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNewItemViewPresented = false
    
    var body: some View {
        Text("Hello!")
            .onTapGesture {
                isNewItemViewPresented = true
            }
            .sheet(isPresented: $isNewItemViewPresented) {
                NewItemView { item in
                    print(item)
                }
                .padding(20)
                .presentationDetents([.medium])
            }
    }
}

#Preview {
    ContentView()
}
