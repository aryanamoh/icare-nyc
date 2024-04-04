//
//  ResourcesView.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/3/24.
//

import SwiftUI

struct ResourcesView: View {
    let resources: [(title: String, url: String)] = [
        ("Resource 1", "https://www.google.com"),
        ("Resource 2", "https://www.apple.com"),
        // Add more resources as needed
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(resources, id: \.title) { resource in
                    Button(action: {
                        if let url = URL(string: resource.url) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text(resource.title)
                    }
                }
            }
            .navigationTitle("Useful Resources")
        }
    }
}

#Preview {
    ResourcesView()
}
