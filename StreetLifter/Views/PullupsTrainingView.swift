
import SwiftUI

struct PullupsTrainingView: View {
    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager
    @State private var showingLevels = false 
    var body: some View {
        BaseTrainingView<BaseTrainingViewModel, Any>(
            viewModel: trainingSessionsManager.pullupsViewModel)
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(R.string.localizable.pullups())
        .sheet(isPresented: $showingLevels) {
            ProgramView().environmentObject(trainingSessionsManager.pullupsViewModel)
        }
    }
}
