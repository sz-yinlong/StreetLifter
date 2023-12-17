import Foundation

struct TrainingSession: Hashable, Identifiable {
    let id = UUID()
    let date: String
    let reps: [Int]
    let weight: [Int]
    let totalReps: Int
}

enum ExerciseType {
    case pullups
    case dips
}




