import SwiftUI
import CoreMotion

struct MotionView: View {
    @StateObject var motionLogic = MotionLogic()

    var body: some View {
        VStack {
            Text("Количество подтягиваний: \(motionLogic.pullUpCount)")
            Button("Начать") {
                motionLogic.startMonitoring()
            }
            Button("Остановить") {
                motionLogic.stopMonitoring()
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        MotionView()
    }
}
