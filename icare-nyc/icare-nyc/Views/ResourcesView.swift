//
//  ResourcesView.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/3/24.
//

import SwiftUI

struct ResourcesView: View {
    let resources: [(title: String, url: String)] = [
        ("Believe New York",
            "https://www.believeny.org/"),
        ("Community Based Resources", "https://www.health.ny.gov/health_care/medicaid/redesign/dsrip/vbp_bootcamp/2017-10-10_cbo_by_region.htm"),
        ("Health Care Access", 
            "https://www.nyccare.nyc/community-based-organization/"),
        ("Specialized High School Admissions FAQs", "https://www.schools.nyc.gov/learning/testing/specialized-high-school-admissions-test#:~:text=Students%20in%20grades%20eight%20or,York%20City%20residents%20are%20eligible"),
        ("Tips for Before Enrolling in School", "https://www.nyc.gov/site/dca/consumers/Before-You-Enroll-in-a-School-or-Training-Program.page"),
        ("Tips for Before Taking out Student Loans", "https://www.nyc.gov/site/dca/consumers/Before-You-Take-Out-Student-Loans-For-Yourself-or-a-Child.page")
    ]

    var body: some View {
        NavigationView {
                List {
                    ForEach(resources, id: \.title) { resource in
                        Button(action: {
                            if let url = URL(string: resource.url) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Text(resource.title)
                        }
                        .accessibilityAddTraits(.isLink)
                    }
                }
            .navigationTitle("Resources")
        }
    }
}

#Preview {
    ResourcesView()
}
