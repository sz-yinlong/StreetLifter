import SwiftUI

struct StatsPageTabView: View {

    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager
    

    var body: some View {
        TabView {
            StatsView(trainingSessions: trainingSessionsManager.pullupsViewModel.trainingSessions, chartColor: ColorConstants.bitterSweet)
            StatsView(trainingSessions: trainingSessionsManager.dipsViewModel.trainingSessions, chartColor: ColorConstants.robinEggBlue)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
