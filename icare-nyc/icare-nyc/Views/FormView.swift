//
//  FormView.swift
//  icare-nyc
//
//  Created by Aryana Mohammadi on 4/23/24.
//

import SwiftUI

struct FormView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var role: String = "Student"
    @State private var selectedProblemType: String = "Flaking Paint"
    @State private var problemDescription: String = ""
    @State private var selectedDistrict: String = "District 1"
    @State private var selectedDistrictIndex = 0
    @State private var selectedSchool: String = ""
    @State private var selectedRoomType: String = "Auditorium"
    @State private var roomName: String = ""
    @State private var selectedFloor: String = ""

    @State private var showAlert = false
    @State private var formSubmitted = false
    @State private var submitError = false
    
    var isFormValid: Bool {
            !role.isEmpty && !selectedProblemType.isEmpty && !problemDescription.isEmpty && !selectedSchool.isEmpty && !selectedFloor.isEmpty && !selectedRoomType.isEmpty && !roomName.isEmpty
        }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Details")) {
                    TextField("Name", text: $name)
                        .accessibilityLabel("Enter your name")
                        .accessibilityHint("Non-required field")
                    TextField("Email", text: $email)
                        .accessibilityLabel("Enter your email")
                        .accessibilityHint("Non-required field")
                    Picker("Role *", selection: $role) {
                        Text("Student").tag("Student")
                        Text("Teacher").tag("Teacher")
                        Text("Parent").tag("Parent")
                        Text("Community Member").tag("Community Member")
                    }
                    .accessibilityLabel("Select Role")
                    .accessibilityHint("Required field")
                }

                Section(header: Text("Problem Details")) {
                    Picker("Problem Type *", selection: $selectedProblemType) {
                        ForEach(FormData.problemTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .accessibilityLabel("Select Problem Type")
                    .accessibilityHint("Required field")
                    
                    TextField("Description *", text: $problemDescription, axis: .vertical)
                        .lineLimit(5...10)
                        .accessibilityLabel("Enter Description")
                        .accessibilityHint("Required field")
                    
                }
                
                

                Section(header: Text("Location Details")) {
                    
                    Picker("Select District *", selection: $selectedDistrictIndex) {
                        ForEach(0..<FormData.districts.count, id: \.self) {
                            Text(FormData.districts[$0])
                        }
                    }
                    .accessibilityLabel("Select District")
                    .accessibilityHint("Required field")
                    .onChange(of: selectedDistrictIndex) {
                        selectedDistrict = FormData.districts[selectedDistrictIndex]
                    }
                                
                    Picker("Select School *", selection: $selectedSchool) {
                        ForEach(FormData.schools[selectedDistrictIndex], id: \.self) { school in
                                Text(school)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .accessibilityLabel("Select school")
                    .accessibilityHint("Required field")
                    
                    Picker("Room Type *", selection: $selectedRoomType) {
                        ForEach(FormData.roomTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .accessibilityLabel("Select Room Type")
                    .accessibilityHint("Required field")
                    
                    TextField("Floor *", text: $selectedFloor)
                        .accessibilityLabel("Enter floor number")
                        .accessibilityHint("Required field")
                    
                    TextField("Room Name / Number *", text: $roomName)
                        .accessibilityLabel("Enter room name or number")
                        .accessibilityHint("Required field")
                }

                Button("Submit") {
                    if isFormValid {
                        Task {
                            let success = await sendFormData()
                            if success {
                                formSubmitted = true
                                resetForm()
                            } else {
                                submitError = true
                            }
                        }
                    } else {
                        showAlert = true
                    }
                }
                .fontWeight(.bold)
                .alert("Error", isPresented: $submitError) {
                    Button("OK") {
                        showAlert = false
                    }
                } message: {
                    Text("There was a problem submitting your form. Please try again later.")
                }
                .alert("Success", isPresented: $formSubmitted) {
                    Button("OK") {
                        formSubmitted = false
                    }
                } message: {
                    Text("Thank you for your feedback!")
                }
                .alert("Error", isPresented: $showAlert) {
                    Button("OK") {
                        formSubmitted = false
                    }
                } message: {
                    Text("Please make sure all required fields are completed.")
                }
            }
            .navigationTitle("Report Form")
        }
    }
    
    
    func sendFormData() async -> Bool {
        do {
            
            let selectedName = name == "" ? "Anonymous" : name
            let selectedEmail = email == "" ? "Anonymous" : email
            
            let success = try await FirestoreManager.shared.createReport(name: selectedName, email: selectedEmail, role: role, problemType: selectedProblemType, problemDescription: problemDescription, district: selectedDistrict, school: selectedSchool, floor: selectedFloor, roomType: selectedRoomType, roomNumber: roomName)
            
            if success {
                print("Report created successfully")
                return true
            } else {
                print("Failed to create report")
                return false
            }
        } catch {
            print("Error creating report: \(error)")
            return false
        }
    }

        func resetForm() {
            name = ""
            email = ""
            role = "Student"
            selectedProblemType = "Flaking Paint"
            problemDescription = ""
            selectedSchool = "School 1a"
            selectedFloor = ""
            selectedRoomType = "Auditorium"
            roomName = ""
            selectedDistrict = "District 1"
            selectedDistrictIndex = 0
        }
    }



struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
