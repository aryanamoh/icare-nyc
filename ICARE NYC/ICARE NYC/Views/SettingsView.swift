//
//  SettingsView.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/3/24.
//

import SwiftUI

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("selectedLanguage") private var selectedLanguage = "English"
    @State private var isNotificationEnabled = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }
                
                Section(header: Text("Notification Settings")) {
                    Toggle("Enable Notifications", isOn: $isNotificationEnabled)
                }

                Section(header: Text("Language")) {
                    Picker("Select Language", selection: $selectedLanguage) {
                        Text("English").tag("English")
                        Text("Spanish").tag("Spanish")
                        // Add more languages as needed
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("About")) {
                    NavigationLink(destination: AboutView()) {
                        Text("About")
                    }
                }

                Section(header: Text("Feedback and Support")) {
                    Button(action: {
                        // Add feedback and support action
                    }) {
                        Text("Send Feedback")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}




#Preview {
    SettingsView()
}
