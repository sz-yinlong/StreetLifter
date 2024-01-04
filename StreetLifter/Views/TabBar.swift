
import SwiftUI

struct TabBar: View {
    var body: some View {
        NavigationStack {
            TabView() {
                MainView()
                    .tabItem {
                        Label("Training", systemImage: "medal")
                    }
                NavigationView {
                    StatsPageTabView()
                }
                .tabItem {
                    Label("Stats", systemImage: "chart.bar.xaxis.ascending")
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(TrainingSessionsManager())
    }
}
