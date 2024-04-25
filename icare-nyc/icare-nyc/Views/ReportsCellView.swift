//
//  ReportsCellView.swift
//  icare-nyc
//
//  Created by Aryana Mohammadi on 4/23/24.
//

import SwiftUI

struct ReportsCellView: View {
    let report: FormModel
    
    let problemSymbols: [String: String] = [
            "Flaking Paint": "paintbrush",
            "Physical Damage": "hammer",
            "Water Damage": "drop",
            "Water / Steam Leaks": "cloud.drizzle",
            "Mold Growth": "leaf",
            "Pest Sightings": "ant",
            "Rodent Droppings": "square.stack.3d.down.right",
            "Thermal Control": "thermometer",
            "Workplace Illness": "person.2",
            "Indoor Air Quality": "wind",
            "Safety Hazards": "exclamationmark.triangle.fill",
            "Other": "questionmark.circle"
        ]
    
    var body: some View {
        ZStack {
            HStack {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(report.problemType)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    Text(report.school)
                        .foregroundStyle(.secondary)
                        .font(.callout)
                    Text(report.timeCreated.formatted(date: .abbreviated, time: .omitted))
                        .foregroundStyle(.secondary)
                        .font(.callout)
                }
                
                Spacer()
                
                Image(systemName: problemSymbols["\(report.problemType)"] ?? "exclamationmark.bubble.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.accent)
            }
            .background(Color.black.opacity(0.001))
        }
    }
}
