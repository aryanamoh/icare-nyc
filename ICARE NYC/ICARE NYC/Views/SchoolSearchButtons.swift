//
//  SchoolSearchButtons.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/3/24.
//

import SwiftUI
import MapKit

struct SchoolSearchButtons: View {
    @Binding var searchResults: [MKMapItem]
    
    var body: some View {
        HStack {
            Button {
                search(for: "public school")
            } label: {
                Label("Schools", systemImage: "building.fill")
            }
            .buttonStyle(.borderedProminent)
        }
        .labelStyle(.iconOnly)
    }
    
    
    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(
            center: .nycCenter, span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
        )
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }
}

