
import SwiftUI

class PullupsTrainingViewModel: BaseTrainingViewModel {
    
    init(storage: TrainingSessionStorage) {
        super.init(storage: storage, trainingSessionsKey: "pullupstrainingSessions")
        self.reps = UserDefaults.standard.integer(forKey: "reps")
        
    }
    
    override func trainingViewType() -> ExerciseType? {
        return .pullups
        }
 
    }

