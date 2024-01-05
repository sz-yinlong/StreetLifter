
import SwiftUI

struct TabBar: View {
    var body: some View {
        NavigationStack {
            TabView {
                MainView()
                    .tabItem {
                        Label(R.string.localizable.training(), systemImage: "medal")
                    }
                NavigationView {
                    StatsPageTabView()
                }
                .tabItem {
                    Label(R.string.localizable.stats(), systemImage: "chart.bar.xaxis.ascending")
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
