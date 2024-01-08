
import SwiftUI

class BaseTrainingViewModel: ObservableObject {
    private let storage: TrainingSessionStorage
    private let trainingType: ExerciseType
    private var originalTrainingLevels: [TrainingSection]
   
    var availableWeights = Array(1 ... 30)
    let noWeight: Int = 0
  
    @Published var showExerciseView = false
   
    @Published var weight: Int
    @Published var trainingSessions: [TrainingSession] = []
    @Published var currentSessionReps: [Int] = []
    @Published var currenSessionWeight: [Int] = []
    @Published var trainingCompleted = false
    @Published var trainingDate: [Int] = []
    @Published var lastSessionTotalReps: Int?
    @Published var isWeightAdded: Bool = false
    @Published var selectedWeightIndex: Int = 0
    @Published var tempSelectedWeight: Int = 0
    @Published var trainingLevels: [TrainingSection] = []
    @Published var selectedLevel = NSLocalizedString("level1", comment: "")
    @Published var currentSetIndex: Int = 0
    @Published var mutableRepetitions: [Int] = []
    @Published var reps: Int
    
    init(storage: TrainingSessionStorage = TrainingSessionStorage(), trainingType: ExerciseType, programData: TrainingProgramData) {
        self.storage = storage
        self.trainingType = trainingType
        self.originalTrainingLevels = trainingType == .pullups ? programData.pullupsTraining : programData.dipsTraining
        self.reps = UserDefaults.standard.integer(forKey: "reps")
        self.weight = UserDefaults.standard.integer(forKey: "weight")
        self.trainingSessions = storage.retrieveSessions(forKey: trainingSessionsKey)
        self.lastSessionTotalReps = trainingSessions.last?.totalReps
        self.trainingLevels = trainingType == .pullups ? programData.pullupsTraining : programData.dipsTraining
        self.reps = currentLevelRepetitions.first ?? 0
    }
    
    var trainingSessionsKey: String {
        switch trainingType {
        case .pullups:
            return "pullupsTrainingSession"
        case .dips:
            return "dipsTrainingSesssion"
        }
    }
  
    var currentLevelRepetitions: [Int] {
        return trainingLevels
            .flatMap { $0.levels }
            .first(where: { $0.level == selectedLevel })?.sets ?? []
    }
 
    var currentRepetition: Int {
        if currentSetIndex < currentLevelRepetitions.count {
            return currentLevelRepetitions[currentSetIndex]
        } else {
            return 0
        }
    }
    
    func saveTrainingSession() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
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
    
    func startNewSession() {
        selectedLevel = NSLocalizedString("level1", comment: "")
        guard let levelRepetitions = trainingLevels
            .flatMap({ $0.levels })
            .first(where: { $0.level == selectedLevel })?.sets
        else {
            return
        }
        currentSessionReps = []
        resetReps()
        mutableRepetitions = levelRepetitions
        currentSetIndex = 0
        reps = mutableRepetitions[currentSetIndex]
        trainingCompleted = false
        currenSessionWeight = []
    }
    
    func resetReps() {
        reps = 0
    }

    func saveWeightForCurrentSession() {
        let weightToAdd = isWeightAdded ? tempSelectedWeight : noWeight
        currenSessionWeight.append(weightToAdd)
    }
    
    func trainingViewType() -> ExerciseType? {
        return nil
    }
    
    func selectLevel(level: String) {
        if let levelSets = originalTrainingLevels
            .flatMap({ $0.levels })
            .first(where: { $0.level == level })?.sets
        {
            withAnimation {
                self.selectedLevel = level
                self.mutableRepetitions = levelSets
                self.currentSetIndex = 0
                self.reps = mutableRepetitions.first ?? 0
                updateCurrentSetReps()
            }
            self.objectWillChange.send()
        }
    }

    func updateCurrentSetReps() {
        if currentSetIndex < mutableRepetitions.count {
            reps = mutableRepetitions[currentSetIndex]
        }
    }

    func saveRepsForCurrentSession() {
        if canAddSet {
            currentSessionReps.append(reps)
            saveWeightForCurrentSession()
            currentSetIndex += 1
            if currentSetIndex < mutableRepetitions.count {
                // Обновляем reps для следующего сета.
                reps = mutableRepetitions[currentSetIndex]
            } else {
                trainingCompleted = true
                saveTrainingSession()
            }
        }
    }

    func completeSet() {
        if currentSetIndex < currentLevelRepetitions.count - 1 {
            currentSetIndex += 1
        } else {}
    }
    
    func incrementReps() {
        if currentSetIndex < mutableRepetitions.count {
            mutableRepetitions[currentSetIndex] += 1
            reps = mutableRepetitions[currentSetIndex]
        }
    }

    func decrementReps() {
        if currentSetIndex < mutableRepetitions.count && mutableRepetitions[currentSetIndex] > 0 {
            mutableRepetitions[currentSetIndex] -= 1
            reps = mutableRepetitions[currentSetIndex]
        }
    }

    func setCurrentRepsToCurrentSet() {
        if currentSetIndex < mutableRepetitions.count {
            reps = mutableRepetitions[currentSetIndex]
        }
    }
}
