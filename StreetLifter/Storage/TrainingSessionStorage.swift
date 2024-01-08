

import Foundation

final class TrainingSessionStorage: ObservableObject {
    
    func saveSession(session:[TrainingSession], forKey key: String) {
        let sessionData: [[String: Any?]] = session.map {
            [
                "id": $0.id.uuidString,
                "date": $0.date,
                "reps": $0.reps,
                "weight": $0.weight,
                "totalReps": $0.totalReps
            ]
        }
        UserDefaults.standard.set(sessionData, forKey: key)
    }
    
    func retrieveSessions(forKey key: String) -> [TrainingSession] {
        if let savedSessions = UserDefaults.standard.array(forKey: key) as? [[String: Any]] {
            return savedSessions.compactMap { sessionData in
                if let idString = sessionData["id"] as? String,
                   let id = UUID(uuidString: idString),
                   let date = sessionData["date"] as? String,
                   let reps = sessionData["reps"] as? [Int],
                   let weight = sessionData["weight"] as? [Int],
                   let totalReps = sessionData["totalReps"] as? Int {
                    return TrainingSession(id: id, date: date, reps: reps, weight: weight, totalReps: totalReps)
                }
                return nil
            }
        }
        return []
    }
}
