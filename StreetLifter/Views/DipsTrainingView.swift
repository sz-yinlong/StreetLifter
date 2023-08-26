

import SwiftUI

struct DipsTrainingView: View {
    
    @StateObject private var viewModel: DipsTrainingViewModel
    
    init() {
        let storage = TrainingSessionStorage()
        _viewModel = StateObject(wrappedValue: DipsTrainingViewModel(storage: storage))
    }
    
    var body: some View {
        BaseTrainingView<DipsTrainingViewModel, Any>(viewModel: viewModel)
            .navigationBarBackButtonHidden()
    }
}

