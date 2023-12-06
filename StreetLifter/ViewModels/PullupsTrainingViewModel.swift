
import SwiftUI

class PullupsTrainingViewModel: BaseTrainingViewModel {
    
    init(storage: TrainingSessionStorage) {
        super.init(storage: storage, trainingSessionsKey: "pullupstrainingSessions")
         
        let savedReps = UserDefaults.standard.array(forKey: "savedReps") as? [Int] ?? []
        let savedWeight = UserDefaults.standard.array(forKey: "savedWeight") as? [Int] ?? []
        
        self.currentSessionReps = savedReps
        self.currenSessionWeight = savedWeight
      
    }
    
    override func trainingViewType() -> ExerciseType? {
        return .pullups
        }
 
    }

