import SwiftUI

struct StatsPageTabView: View {

    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager
    

    var body: some View {
        TabView {
            StatsView(trainingSessions: trainingSessionsManager.pullupsViewModel.trainingSessions, chartColor: ColorConstants.bitterSweet)
                .navigationTitle(R.string.localizable.pullups())
            StatsView(trainingSessions: trainingSessionsManager.dipsViewModel.trainingSessions, chartColor: ColorConstants.robinEggBlue)
                .navigationTitle(R.string.localizable.dips())
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
