//
//  HomeView.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/2/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let uft = CLLocationCoordinate2D(latitude: 40.707127045459664, longitude: -74.01262391534208)
    static let nycCenter = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
}

struct HomeView: View {
    @State private var searchResults: [MKMapItem] = []
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
            span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        )
    
    var body: some View {
        NavigationView {
            VStack {
                Map {
                    Marker("United Federation of Teachers", coordinate: .uft)
                    
                    ForEach(searchResults, id: \.self) { result in
                        Marker(item: result)
                    }
                }
                .mapStyle(.standard(elevation: .realistic))
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .circular))
                .padding([.bottom, .top], 60)
                .padding([.horizontal], 20)
                
                //        .safeAreaInset(edge: .bottom) {
                //            HStack {
                //                Spacer()
                //                SchoolSearchButtons(searchResults: $searchResults)
                //                    .padding(.top)
                //                Spacer()
                //            }
                //            .background(.thinMaterial)
                //        }
                //        .padding(30)
            }
            .navigationTitle("Home")
        }
    }
    
}

#Preview {
    HomeView()
}
