//
//  TabBar.swift
//  StreetLifter
//
//  Created by Artem on 06.12.2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
          PullupsExerciseView()
                .tabItem {
                    Label(R.string.localizable.pullups(), systemImage: "chevron.up.circle")
                }
            DipsExerciseView()
                .tabItem {
                    Label(R.string.localizable.dips(), systemImage: "chevron.down.circle")
                }
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .accentColor(ColorConstants.buttonColor)
    }
}



#Preview {
    TabBar()
}
