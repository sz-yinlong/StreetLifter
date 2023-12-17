
import SwiftUI

@main
struct StreetLifterApp: App {
    @StateObject var viewModel = TrainingSessionsManager()
    
    var body: some Scene {
        WindowGroup {
         SplashView()
                .environment(\.colorScheme, .light)
                .environmentObject(viewModel)
        }
    }
}
