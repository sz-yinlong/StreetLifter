import SwiftUI

struct StatsPageTabView: View {

    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager

    var body: some View {
        TabView {
            StatsView(trainingSessions: trainingSessionsManager.pullupsViewModel.trainingSessions)
            StatsView(trainingSessions: trainingSessionsManager.dipsViewModel.trainingSessions)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
