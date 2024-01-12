import SwiftUI

enum DateManager {
    static func generateDatesForCurrentMonth() -> [Date] {
        var dates: [Date] = []
        let calendar = Calendar.current
        let today = Date()
        let range = calendar.range(of: .day, in: .month, for: today)!

        for dayOffset in 0 ..< range.count {
            if let date = calendar.date(byAdding: .day, value: dayOffset, to: today.startOfMonth) {
                dates.append(date)
            }
        }

        return dates
    }
}

extension Date {
    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)!
    }
}
