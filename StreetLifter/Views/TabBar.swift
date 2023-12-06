//
//  TabBar.swift
//  StreetLifter
//
//  Created by Artem on 06.12.2023.
//

import SwiftUI

struct TabBar: View {
    //    @State var tabSelection: Tabs = .tab1
    
    var body: some View {
        NavigationStack {
            TabView() {
                NavigationLink(destination: PullupsExerciseView()) {
                    PullupsExerciseView()
                }
                .tabItem {
                    Label(R.string.localizable.pullups(), systemImage: "chevron.up.circle")
                }
                NavigationLink(destination: DipsExerciseView()) {
                    DipsExerciseView()
                }
                .tabItem {
                    Label(R.string.localizable.dips(), systemImage: "chevron.down.circle")
                }
            }
        }
        .accentColor(ColorConstants.buttonColor)
    }
}

#Preview {
    TabBar()
}
