//
//  FormView.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/3/24.
//

import SwiftUI

struct FormView: View {
    // Form fields
    @State private var name: String = "" // Autofill if signed in
    @State private var email: String = "" // Autofill if signed in
    @State private var role: String = ""
    @State private var selectedProblemType: String = ""
    @State private var problemDescription: String = ""
    @State private var selectedSchool: String = ""
    @State private var selectedFloor: String = ""
    @State private var selectedRoomType: String = ""
    @State private var roomName: String = ""

    // Problem types and room types
    let problemTypes = ["Flaking Paint", "Physical Damage", "Water Damage", "Water / Steam Leaks", "Mold Growth", "Pest Sightings", "Rodent Droppings", "Thermal Control", "Workplace Illness", "Indoor Air Quality", "Safety Hazards", "Other"]
    let roomTypes = ["Auditorium", "Bathroom", "Boiler Room", "Cafeteria", "Classroom", "Computer Room", "Conference Room", "Custodial Closet", "Entrance Area", "Gym", "Hallway", "Kitchen", "Library", "Locker Room", "Lounge", "Mechanical Room", "Music Room", "Office", "Shaft", "Stairwell", "Storage", "Other", "None"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Details")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                    Picker("Role", selection: $role) {
                        Text("Student").tag("Student")
                        Text("Teacher").tag("Teacher")
                        Text("Parent").tag("Parent")
                        Text("Community Member").tag("Community Member")
                    }
                }

                Section(header: Text("Problem Details")) {
                    Picker("Problem Type", selection: $selectedProblemType) {
                        ForEach(problemTypes, id: \.self) { type in
                            Text(type)
                        }
                    }

                    TextEditor(text: $problemDescription)
                        .frame(minHeight: 100)
                    
                    Picker("School", selection: $selectedSchool) {
                        // Populate with schools
                    }
                    
                    Picker("Floor", selection: $selectedFloor) {
                        // Populate with floors
                    }
                }

                Section(header: Text("Location Details")) {
                    Picker("Room Type", selection: $selectedRoomType) {
                        ForEach(roomTypes, id: \.self) { type in
                            Text(type)
                        }
                    }

                    TextField("Room Name / Number", text: $roomName)
                }

                Button("Submit") {
                    // Implement submit action
                }
            }
            .navigationTitle("Report Form")
        }
    }
}


#Preview {
    FormView()
}
