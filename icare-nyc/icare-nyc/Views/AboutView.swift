//
//  AboutView.swift
//  ICARE NYC
//
//  Created by Aryana Mohammadi on 4/3/24.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About the App")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("This app was developed by Aryana Mohammadi and Erika Kitzmiller's Education Policy course for the MORE caucus of NYC's teachers union.")
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About the MORE Caucus")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("The Movement of Rank and File Educators (MORE) is a movement of New York City teachers fighting for more just schools. Our motto is \"our working conditions are our students' learning conditions\".")
                        
                        
                        Text("Get Involved")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("To get involved with the MORE Caucus, visit their website:")
                        Button("MORE Caucus Website") {
                            if let url = URL(string: "https://morecaucusnyc.org/") {
                                UIApplication.shared.open(url)
                            }
                        }
                        .accessibilityAddTraits(.isLink)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Support the App")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("This app is run and maintained by the MORE Caucus. Donations to keep the app running are appreciated. You can donate on the MORE Caucus website.")
                        Button("Donate to MORE Caucus") {
                            if let url = URL(string: "https://morecaucusnyc.org/donate/") {
                                UIApplication.shared.open(url)
                            }
                        }
                        .accessibilityAddTraits(.isLink)
                        
                        ZStack {
                            Image("MORE-lockup-red")
                                .resizable()
                                .scaledToFit()
                            
                        }
                        .padding(.horizontal,100)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    }
                }
                .padding()
                
                Spacer()
                
                // Footer with app version and license
                VStack {
                    Text("App Version: 1.0")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.bottom, 4)
                    Text("Licensed under MIT License")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .navigationTitle("About")
        }
}



#Preview {
    AboutView()
}
