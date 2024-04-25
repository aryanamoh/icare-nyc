//
//  ReportDetailView.swift
//  icare-nyc
//
//  Created by Aryana Mohammadi on 4/23/24.
//

import SwiftUI

struct ReportDetailView: View {
    let report: FormModel
    
    var body: some View {
        ZStack {
            
            Color(.secondarySystemBackground)
            
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Report Details")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                CellView(title: "Location", keyValuePairs: [
                    KeyValue(key: "School", value: report.school),
                    KeyValue(key: "District", value: report.district),
                    KeyValue(key: "Floor", value: report.floor),
                    KeyValue(key: "Room Type", value: report.roomType),
                    KeyValue(key: "Room Number", value: report.roomNumber)
                ])
                .clipped()
                .accessibilityElement(children: .combine)
                
                CellView(title: "Submitted By", keyValuePairs: [
                    KeyValue(key: "Role", value: report.role)
                ])
                .clipped()
                .accessibilityElement(children: .combine)
                
                CellView(title: "Problem Details", keyValuePairs: [
                    KeyValue(key: "Problem Type", value: report.problemType),
                    KeyValue(key: "Problem Description", value: report.problemDescription)
                ])
                .clipped()
                .accessibilityElement(children: .combine)
                
                Spacer()
            }
            .padding(.top, 40)

        }
    }
}

struct CellView: View {
    let title: String
    let keyValuePairs: [KeyValue]
    
    var body: some View {
        
        
        ScrollView(.horizontal) {
            ZStack {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        SectionHeadingView(title: title)
                        ForEach(keyValuePairs, id: \.self) { keyValue in
                            KeyValueView(key: keyValue.key, value: keyValue.value)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                
                }
                .padding(.vertical)
            }

        }
    }
}


struct SectionHeadingView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.bold)
            .padding(.horizontal)
            .padding(.bottom, 5)
    }
}

struct KeyValueView: View, Hashable {
    let key: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(key):")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)
            Text(value)
                .font(.subheadline)
        }
    }
}

struct KeyValue: Hashable {
    let key: String
    let value: String
}
