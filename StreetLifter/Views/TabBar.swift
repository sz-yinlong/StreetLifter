//
//  TabBar.swift
//  StreetLifter
//
//  Created by Artem on 06.12.2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            MainView(viewModel: PullupsTrainingViewModel(storage: TrainingSessionStorage()))
                .tabItem {
                    Label("Main", systemImage: "medal.fill")
                }
            DipsExerciseView()
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
