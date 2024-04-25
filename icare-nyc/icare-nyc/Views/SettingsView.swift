//
//  SettingsView.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/3/24.
//

import SwiftUI

import SwiftUI

struct SettingsView: View {

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferences")) {
                    Text("The app is designed to match the language and visual preferences of your phone. Please navigate to your settings app to change your preferences.")
                }
                
                Section(header: Text("About")) {
                    NavigationLink(destination: AboutView()) {
                        Text("About")
                    }
                    .accessibilityLabel("Open About Page")
                }
            

                Section(header: Text("Feedback and Support")) {
                    Button(action: {
                        if let url = URL(string: "https://forms.gle/gBsBKWKKh55vokYK6") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Send Feedback")
                    }
                    .accessibilityAddTraits(.isLink)
                }
            }
            .navigationTitle("Settings")
        }
    }
}




#Preview {
    SettingsView()
}
