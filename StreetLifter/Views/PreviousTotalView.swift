//
//  PreviousTotalView.swift
//  StreetLifter
//
//  Created by Artem on 05.12.2023.
//

import SwiftUI

struct PreviousTotalView: View {
    
    
    
    var body: some View {
        VStack {
            Text("Previous Total")
                .padding(10)
            HStack {
                VStack {
                    Label("20", systemImage: "circle")
                        .font(.system(size: 100))
                        .background(.thinMaterial)
                        .border(.clear)
                        .cornerRadius(20)
                        .labelStyle(.titleOnly)
                    Text("pull-ups")
                }
              
                VStack {
                    Label("20", systemImage: "circle")
                        .font(.system(size: 100))
                        .background(.thinMaterial)
                        .border(.clear)
                        .cornerRadius(20)
                        .labelStyle(.titleOnly)
                    Text("dips")
                }
            }
        }
        Spacer()
        VStack {
            
        }
    }
}

#Preview {
    PreviousTotalView()
}
