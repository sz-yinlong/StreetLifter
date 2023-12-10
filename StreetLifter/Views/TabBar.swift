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
                    Label("Sats", systemImage: "chart.bar.doc.horizontal.fill")
                }
        }
        .accentColor(ColorConstants.buttonColor)
    }
}

#Preview {
    TabBar()
}
