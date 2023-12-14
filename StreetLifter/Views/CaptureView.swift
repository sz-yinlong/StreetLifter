//
//  LastSessionView.swift
//  StreetLifter
//
//  Created by Artem on 13.12.2023.
//

import SwiftUI


struct CaptureView: View {

    var body: some View {

        GeometryReader { geo in
            ZStack(alignment: .center){
        
                Circle()
                    .foregroundStyle(.mint)
                    .padding(EdgeInsets(top: geo.size.height * 0.42, leading: geo.size.width * 0.8, bottom: geo.size.height * 0.5, trailing: 0))
                    .blur(radius: 8.0)
                Button("Camera", systemImage: "camera", action: <#T##() -> Void#>)
                    .padding(EdgeInsets(top: geo.size.height * 0.42, leading: geo.size.width * 0.8, bottom: geo.size.height * 0.5 , trailing: 0))
            
        }
            .offset(x: 10, y: -30)
          
        }
    }
}

#Preview {
    TabBar()
}


