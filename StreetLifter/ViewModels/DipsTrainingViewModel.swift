
import SwiftUI

class DipsTrainingViewModel: BaseTrainingViewModel {
    
    init() {
        super.init(trainingSessionsKey: "dipstrainingSessions")
        self.reps = UserDefaults.standard.integer(forKey: "reps")
    }
     override func trainingViewType() -> ExerciseType? {
        return .dips
        
    }
}

