//
//  NavBarView.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/3/24.
//

import SwiftUI

struct NavBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            FormView()
                .tabItem {
                    Image(systemName: "exclamationmark.triangle.fill")
                }
            ResourcesView()
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
        }
    }
}

#Preview {
    NavBarView()
}
