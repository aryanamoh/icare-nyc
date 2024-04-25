//
//  FormModel.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/2/24.
//


import Foundation
import SwiftUI

struct FormModel: Identifiable, Codable {
    var id: String
    let name: String
    let email: String
    let role: String
    let problemType: String
    let problemDescription: String
    let district: String
    let school: String
    let floor: String
    let roomType: String
    let roomNumber: String
    let timeCreated: Date
}

