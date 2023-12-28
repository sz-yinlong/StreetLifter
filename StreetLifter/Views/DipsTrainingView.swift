

import SwiftUI

struct DipsTrainingView: View {
    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager
    @State private var showingLevels = false
    var body: some View {
        BaseTrainingView<BaseTrainingViewModel, Any>(viewModel: trainingSessionsManager.dipsViewModel, backgroundColor: Constants.robinEggBlue.opacity(1))
            .toolbar(.hidden, for: .tabBar)
            .navigationTitle(R.string.localizable.dips())
            .sheet(isPresented: $showingLevels) {
                ProgramView().environmentObject(trainingSessionsManager.pullupsViewModel)
            }
    }
}
