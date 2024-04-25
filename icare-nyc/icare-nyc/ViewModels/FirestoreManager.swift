//
//  FirestoreManager.swift
//  icare-nyc
//
//  Created by Aryana Mohammadi on 4/23/24.
//
import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

final class FirestoreManager {
    static let shared = FirestoreManager()
    
    private init() {}
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    } ()
    
    private let reportsCollection = Firestore.firestore().collection("reports")
    
    func createReport(name: String, email: String, role: String, problemType: String, problemDescription: String, district: String, school: String, floor: String, roomType: String, roomNumber: String) async throws -> Bool {
        let entry = reportsCollection.document()
        let docID = entry.documentID
        let timeCreated = Date()
        
        let formData = FormModel(id: docID, name: name, email: email, role: role, problemType: problemType, problemDescription: problemDescription, district: district, school: school, floor: floor, roomType: roomType, roomNumber: roomNumber, timeCreated: timeCreated)
        
        do {
            try entry.setData(from: formData, encoder: encoder)
            return true
        } catch let error {
            print("Error writing entry to Firestore: \(error)")
            return false
          }
    }
    
    func getReportsByDistrict(district: String) async throws -> [FormModel] {
        print("Begin Firestore Manager")
        let snapshots = try await reportsCollection.whereField("district", isEqualTo: district).limit(to: 50).getDocuments()
        
        var reports: [FormModel] = []
        
        for document in snapshots.documents {
            let data = document.data()
            print(data.keys)
            
            let id = data["id"] as? String ?? "None"
            let name = data["name"] as? String ?? "None"
            let email = data["email"] as? String ?? "None"
            let role = data["role"] as? String ?? "None"
            let problemType = data["problem_type"] as? String ?? "None"
            let problemDescription = data["problem_description"] as? String ?? "None"
            let district = data["district"] as? String ?? "None"
            let school = data["school"] as? String ?? "None"
            let roomType = data["room_type"] as? String ?? "None"
            let roomNumber = data["room_number"] as? String ?? "None"
            let floor = data["floor"] as? String ?? "None"
            let date = data["name"] as? Date ?? Date()

            let formModel = FormModel(id: id, name: name, email: email, role: role, problemType: problemType, problemDescription: problemDescription, district: district, school: school, floor: floor, roomType: roomType, roomNumber: roomNumber, timeCreated: date)
            
            reports.append(formModel)
                
        }
        return reports

    }
}


//extension Query {
//    func getDocuments(as type: FormModel.Type) async throws -> [FormModel] {
//
//        let snapshot = try await self.getDocuments()
//        print(snapshot.documents.count)
//        print(snapshot.documents.first as Any)
//        
//        var reports: [FormModel] = []
//
//        for document in snapshot.documents {
//            print("Try report")
//            let report = try document.data(as: FormModel.self)
//            reports.append(report)
//        }
//        
//        return reports
//    }
//}
