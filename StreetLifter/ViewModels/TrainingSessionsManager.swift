import Combine

class TrainingSessionsManager: ObservableObject {
    
    @Published var pullupsViewModel: BaseTrainingViewModel
    @Published var dipsViewModel: BaseTrainingViewModel
    
    init() {
        pullupsViewModel = BaseTrainingViewModel(trainingType: .pullups)
        dipsViewModel = BaseTrainingViewModel(trainingType: .dips)
    }
}
