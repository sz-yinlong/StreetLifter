
import SwiftUI

struct PullupsTrainingView: View {
    
    @StateObject private var viewModel: PullupsTrainingViewModel
    
    init() {
        let storage = TrainingSessionStorage()
        _viewModel = StateObject(wrappedValue: PullupsTrainingViewModel(storage: storage))
    }
    
    var body: some View {
        BaseTrainingView<PullupsTrainingViewModel, Any>(viewModel: viewModel)
    }
    
}
