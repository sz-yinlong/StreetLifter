import Combine

class TrainingSessionsManager: ObservableObject {
    
    @Published var pullupsViewModel: BaseTrainingViewModel
    @Published var dipsViewModel: BaseTrainingViewModel
    
    init() {
        let programData = TrainingProgramData()
        pullupsViewModel = BaseTrainingViewModel(trainingType: .pullups, programData: programData)
        dipsViewModel = BaseTrainingViewModel(trainingType: .dips,programData: programData)
    }
}
