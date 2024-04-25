//
//  ReportsViewModel.swift
//  icare-nyc
//
//  Created by Aryana Mohammadi on 4/23/24.
//

import Foundation

@MainActor
final class ReportsViewModel: ObservableObject {
    @Published private(set) var reports: [FormModel] = []
    @Published var selectedFilter: String = "District 1"
    
    func getReportsByDistrict() async throws {
        self.reports = try await FirestoreManager.shared.getReportsByDistrict(district: self.selectedFilter)
    }
    
    func filterSelected(district: String) async throws{
        self.selectedFilter = district
        self.reports = try await FirestoreManager.shared.getReportsByDistrict(district: self.selectedFilter)
    }
    
}
