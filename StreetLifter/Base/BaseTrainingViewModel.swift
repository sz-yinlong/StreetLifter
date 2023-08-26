
import SwiftUI

class BaseTrainingViewModel: TrainingViewModelProtocol, ObservableObject {
    
  
    
    var trainingSessionsKey: String
    let availableWeights: [Int] = [10, 15, 20, 25,30]
    
   
    
    @Published var showExerciseView = false
    @Published var reps: Int
    @Published var trainingSessions: [TrainingSession] = []
    @Published var currentSessionReps: [Int] = []
    @Published var trainingCompleted = false
    @Published var trainingDate: [Int] = []
    
    struct TrainingSession: Hashable {
        let date: String
        let reps: [Int]
    }
    
    init(trainingSessionsKey: String) {
        
        self.trainingSessionsKey = trainingSessionsKey // Use the correct variable name here
        self.reps = UserDefaults.standard.integer(forKey: "reps")
        
        if let savedSessions = UserDefaults.standard.array(forKey: trainingSessionsKey) as? [[String:Any]] {
            self.trainingSessions = savedSessions.compactMap { sessionData in
                if let date = sessionData["date"] as? String,
                let reps = sessionData["reps"] as? [Int] {
                    return TrainingSession(date: date, reps: reps)
                }
                return nil
            }
        }
    }
    
    func saveTrainingSession() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd"
        let date = dateFormatter.string(from: Date())
        
        let sessionDictionary: [String: Any] = [
            "date": date,
            "reps": currentSessionReps
        ]
        
       
        
        var savedSessions = UserDefaults.standard.array(forKey: trainingSessionsKey) as? [[String: Any]] ?? []
        savedSessions.append(sessionDictionary)
        
        UserDefaults.standard.set(savedSessions, forKey: trainingSessionsKey)
        print("Training session saved: \(savedSessions)")
    }
    
    var canAddSet: Bool {
        currentSessionReps.count < 5
    }
    
    var totalReps: Int {
        return currentSessionReps.reduce(0, +)
    }
    func decrementReps() {
        if reps > 1 {
            reps -= 1
        }
    }
    
    func incrementReps() {
        reps += 1
    }
    
    func resetReps() {
        reps = 0
    }
    
    func startNewSession() {
        currentSessionReps = []
        resetReps()
    }
    
    func saveRepsForCurrentSession() {
        if currentSessionReps.count < 5 {
            currentSessionReps.append(reps)
        }
    }
    
    func trainingViewType() -> ExerciseType? {
       return nil
       }
   
  
}
