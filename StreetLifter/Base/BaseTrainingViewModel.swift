
import SwiftUI

class BaseTrainingViewModel: TrainingViewModelProtocol, ObservableObject {
    
    private let storage: TrainingSessionStorage// injected
  
    
    var trainingSessionsKey: String
    let availableWeights: [Int] = [10, 15, 20, 25,30]
    
   
    
    @Published var showExerciseView = false
    @Published var reps: Int
    @Published var trainingSessions: [TrainingSession] = []
    @Published var currentSessionReps: [Int] = []
    @Published var trainingCompleted = false
    @Published var trainingDate: [Int] = []
    @Published var lastSessionTotalReps: Int?
    
   
//
//    init(trainingSessionsKey: String) {
//
//        self.trainingSessionsKey = trainingSessionsKey // Use the correct variable name here
//        self.reps = UserDefaults.standard.integer(forKey: "reps")
//
//        if let savedSessions = UserDefaults.standard.array(forKey: trainingSessionsKey) as? [[String:Any]] {
//            self.trainingSessions = savedSessions.compactMap { sessionData in
//                if let date = sessionData["date"] as? String,
//                   let reps = sessionData["reps"] as? [Int],
//                    let totalReps = sessionData["totalReps"] as? Int {
//                    return TrainingSession(date: date, reps: reps, totalReps: totalReps)
//                }
//                return nil
//            }
//        }
//    }
    init(storage: TrainingSessionStorage, trainingSessionsKey: String) {
        self.storage = storage
        self.trainingSessionsKey = trainingSessionsKey
        self.reps = UserDefaults.standard.integer(forKey: "reps")
        self.trainingSessions = storage.retrieveSessions(forKey: trainingSessionsKey)
    }
    

    
    func saveTrainingSession() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd"
        let date = dateFormatter.string(from: Date())
        
        let newSession = TrainingSession(date: date, reps: currentSessionReps, totalReps: totalReps)
        trainingSessions.append(newSession)
        
//        let sessionDictionary: [String: Any] = [
//            "date": date,
//            "reps": currentSessionReps,
//            "totalReps": totalReps
//        ]
        
        lastSessionTotalReps = totalReps
        storage.saveSession(session: trainingSessions, forKey: trainingSessionsKey)
        
//
//
//        var savedSessions = UserDefaults.standard.array(forKey: trainingSessionsKey) as? [[String: Any]] ?? []
//        savedSessions.append(sessionDictionary)
//
//        UserDefaults.standard.set(savedSessions, forKey: trainingSessionsKey)
//        print("Training session saved: \(savedSessions)")
    }
    
    func mostRecentTotalReps(for exerciseType: ExerciseType) -> Int? {
        // Filtering based on ExerciseType if necessary
        return trainingSessions.last?.totalReps
    }
    
    func updateMostRecentTotalReps() {
        self.lastSessionTotalReps = trainingSessions.last?.totalReps
    }
    
    var canAddSet: Bool {
        currentSessionReps.count < 5
    }
    
    var mostRecentTotalReps: Int? {
        return trainingSessions.last?.totalReps
    }
    
    var totalReps: Int {
        let total = currentSessionReps.reduce(0, +)
        
    print("Total reps updated: \(total)")
        return total
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
