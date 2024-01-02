import Foundation

struct TrainingSession: Hashable, Identifiable {
    var id = UUID()
    let date: String
    let reps: [Int]
    let weight: [Int]
    let totalReps: Int
    
    var combinedRepsAndWeight: [RepsAndWeight] {
           return Array(zip(reps, weight)).map { RepsAndWeight(reps: $0, weight: $1) }
       }
    
    init(id: UUID = UUID(), date: String, reps: [Int], weight: [Int], totalReps: Int) {
           self.id = id
           self.date = date
           self.reps = reps
           self.weight = weight
           self.totalReps = totalReps
       }
}

enum ExerciseType {
    case pullups
    case dips
}

struct RepsAndWeight: Hashable, Identifiable {
    var id = UUID()
    let reps: Int
    let weight: Int
    
    init(id: UUID = UUID(), reps: Int, weight: Int) {
        self.id = id
        self.reps = reps
        self.weight = weight
    }
}


struct TrainingSection: Hashable, Identifiable {
    let id = UUID()
    let title: String
    var levels: [TrainingLevel]
}

struct TrainingLevel: Hashable, Identifiable {
    let id = UUID()
    let level: String
    var sets: [Int]
}
