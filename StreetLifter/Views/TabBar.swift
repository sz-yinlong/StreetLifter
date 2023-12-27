
import SwiftUI

struct TabBar: View {
    var body: some View {
        NavigationStack {
            TabView() {
                MainView()
                    .tabItem {
                        Label("Training", systemImage: "medal")
                    }
                ProgramView()
                    .tabItem {
                        Label("Program", systemImage: "line.3.horizontal")
                    }
            }
            .accentColor(Constants.tomato)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
