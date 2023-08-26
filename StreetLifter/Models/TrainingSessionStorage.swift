

import Foundation

class TrainingSessionStorage {
    
    func saveSession(session:[TrainingSession], forKey key: String) {
        let sessionData: [[String: Any]] = session.map { ["date": $0.date, "reps": $0.reps, "totalReps": $0.totalReps] }
        UserDefaults.standard.set(sessionData, forKey: key)
    }
    
    func retrieveSessions(forKey key: String) -> [TrainingSession] {
        if let savedSessions = UserDefaults.standard.array(forKey: key) as? [[String: Any]] {
            return savedSessions.compactMap { sessionData in
                if let date = sessionData["date"] as? String,
                   let reps = sessionData["reps"] as? [Int],
                   let totalReps = sessionData["totalReps"] as? Int {
                    return TrainingSession(date: date, reps: reps, totalReps: totalReps)
                }
                return nil
            }
        }
        return []
    }
}
