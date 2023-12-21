
import SwiftUI

@main
struct StreetLifterApp: App {
   
    var body: some Scene {
        WindowGroup {
         SplashView()
                .environment(\.colorScheme, .light)
                .environmentObject(TrainingSessionsManager())
        }
    }
}
