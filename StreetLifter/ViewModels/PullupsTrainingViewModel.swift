
import SwiftUI

class PullupsTrainingViewModel: BaseTrainingViewModel {
    
    init() {
        super.init(trainingSessionsKey: "pullupstrainingSessions")
        self.reps = UserDefaults.standard.integer(forKey: "reps")
    }
    
    override func trainingViewType() -> ExerciseType? {
        return .pullups
        }
 
    }

