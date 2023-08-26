

import SwiftUI

class DipsTrainingViewModel: BaseTrainingViewModel {
    
    init(storage: TrainingSessionStorage) {
        super.init(storage: storage, trainingSessionsKey: "dipstrainingSessions")
        self.reps = UserDefaults.standard.integer(forKey: "reps")
        
    }
    
    override func trainingViewType() -> ExerciseType? {
        return .pullups
        }
 
    }

