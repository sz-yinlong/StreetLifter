

import SwiftUI

struct PullupsTrainingView: View {
    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager
    @State private var showingLevels = false // Состояние для отображения модального окна

    var body: some View {
        BaseTrainingView<BaseTrainingViewModel, Any>(
            viewModel: trainingSessionsManager.pullupsViewModel,
            backgroundColor: Constants.bitterSweet.opacity(1)
        )
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(R.string.localizable.pullups())
        .sheet(isPresented: $showingLevels) {
            ProgramView().environmentObject(trainingSessionsManager.pullupsViewModel)
        }
    }
}
