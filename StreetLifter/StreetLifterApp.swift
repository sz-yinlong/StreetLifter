
import SwiftUI

@main
struct StreetLifterApp: App {
    
    var body: some Scene {
        WindowGroup {
        TabBar()
                .environment(\.colorScheme, .light)
                .environmentObject(TrainingSessionsManager())
        }
    }
}
