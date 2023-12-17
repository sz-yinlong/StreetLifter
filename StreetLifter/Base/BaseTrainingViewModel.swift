
import SwiftUI

class BaseTrainingViewModel: ObservableObject {

    private let storage: TrainingSessionStorage
    private let trainingType: ExerciseType
    
   
    let availableWeights = Array(1...30)
    
   
    
    @Published var showExerciseView = false
    @Published var reps: Int
    @Published var weight: Int
    @Published var trainingSessions: [TrainingSession] = []
    @Published var currentSessionReps: [Int] = []
    @Published var currenSessionWeight: [Int] = []
    @Published var trainingCompleted = false
    @Published var trainingDate: [Int] = []
    @Published var lastSessionTotalReps: Int?
    
   

    init(storage: TrainingSessionStorage = TrainingSessionStorage(), trainingType: ExerciseType) {
        self.storage = storage
        self.trainingType = trainingType
        self.reps = UserDefaults.standard.integer(forKey: "reps")
        self.weight = UserDefaults.standard.integer(forKey: "weight")
        self.trainingSessions = storage.retrieveSessions(forKey: trainingSessionsKey)
        self.lastSessionTotalReps = trainingSessions.last?.totalReps
    }
    
    var trainingSessionsKey: String {
        switch trainingType {
        case .pullups:
            return "pullupsTrainingSession"
        case .dips:
          return "dipsTrainingSesssion"
        }
    }
 
    
    func saveTrainingSession() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd"
        let date = dateFormatter.string(from: Date())
        let newSession = TrainingSession(date: date, reps: currentSessionReps, weight: currenSessionWeight, totalReps: totalReps)
        trainingSessions.append(newSession)
        lastSessionTotalReps = totalReps
        storage.saveSession(session: trainingSessions, forKey: trainingSessionsKey)
        print("total reps\(totalReps)")

    }
    
    
    func updateMostRecentTotalReps() {
        self.lastSessionTotalReps = trainingSessions.last?.totalReps

    }
    
    var canAddSet: Bool { currentSessionReps.count < 5 }
    var mostRecentTotalReps: Int? { return trainingSessions.last?.totalReps }
    
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
    func saveWeightForCurrentSession(weight: Int) {
        currenSessionWeight.append(weight)
    }
    
    func trainingViewType() -> ExerciseType? {
       return nil
       }
}
