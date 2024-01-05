
import SwiftUI

@main
struct StreetLifterApp: App {
    
    var body: some Scene {
        WindowGroup {
        MotionView()
                .environment(\.colorScheme, .light)
                .environmentObject(TrainingSessionsManager())
        }
    }
}
