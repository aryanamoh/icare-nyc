//
//  ReportsView.swift
//  icare-nyc
//
//  Created by Aryana Mohammadi on 4/23/24.
//

import SwiftUI

struct ReportsView: View {
    @StateObject private var viewModel = ReportsViewModel()
    
    @State private var selectedReport: FormModel?

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.reports.isEmpty {
                    Text("No recent reports for \(viewModel.selectedFilter)")
                } else {
                    List(viewModel.reports, id: \.id) { report in
                        ZStack {
                            ReportsCellView(report: report)
                                .accessibilityElement(children: .combine)
                                .onTapGesture {
                                    selectedReport = report
                                }
                                .accessibilityHint("Click to open report details.")
                                .accessibilityAddTraits(.isButton)
                        }
                        .shadow(radius: 5)
                    }
                }
            }
            .navigationTitle("Recent Reports")
            .sheet(item: $selectedReport, content: { report in
                ReportDetailView(report: report)
                    .accessibilityAddTraits(.isModal)
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Search for: \(viewModel.selectedFilter)") {
                        ForEach(FormData.districts, id: \.self) { districtOption in
                            Button(districtOption) {
                                Task {
                                    try? await viewModel.filterSelected(district: districtOption)
                                }
                            }
                            .accessibilityHint("Click to search reports by district.")
                        }
                    }
                }
            })
            .task {
                print("Load page")
                try? await viewModel.getReportsByDistrict()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsView()
    }
}
