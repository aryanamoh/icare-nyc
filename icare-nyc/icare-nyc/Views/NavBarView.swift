//
//  NavBarView.swift
//  icare-nyc
//
//  Created by Aryana Mohammadi on 4/23/24.
//

import SwiftUI

struct NavBarView: View {
    var body: some View {
        TabView {
            ReportsView()
                .tabItem {
                    Image(systemName: "person.line.dotted.person.fill")
                        .accessibilityLabel("Recent Reports")
                }
                
            FormView()
                .tabItem {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .accessibilityLabel("Infrastructure Reporting Form")
                }
                
            ResourcesView()
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                        .accessibilityLabel("Resources")
                }
                
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                        .accessibilityLabel("Settings")
                }
                
        }
    }
}

#Preview {
    NavBarView()
}
