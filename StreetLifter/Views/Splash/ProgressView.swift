import SwiftUI


struct ProgressView: View {
    
    var title: String
    var trainingSessions: [[Int]]
    
    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.title2)
            
            if trainingSessions.isEmpty {
                Text("No data available")
                    .foregroundColor(.gray)
            } else {
                VStack {
                    GeometryReader { geometry in
                        let padding: CGFloat = 20
                        let graphWidth = geometry.size.width - 2 * padding
                        let graphHeight: CGFloat = 80
                        let maxReps = CGFloat(trainingSessions.flatMap { $0 }.max() ?? 1)
                        let barWidth = graphWidth / CGFloat(trainingSessions.count)
                        
                        // Draw bars
                        ForEach(0..<trainingSessions.count, id: \.self) { index in
                            let totalRepsForSession = CGFloat(trainingSessions[index].reduce(0, +))
                            let progress = totalRepsForSession / maxReps
                            let x = padding + barWidth * CGFloat(index)
                            let barHeight = graphHeight * progress / 2 // Adjusting the height of the bars
                            let y = geometry.size.height // Starting bars at the bottom of the frame
                            
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: barWidth - 5, height: barHeight)
                                .position(x: x + barWidth / 2, y: y - barHeight / 2) // Adjusting the position
                        }
                    }
                    .frame(height: 100)
                    .padding(.horizontal, 10)
                    
                    // X-axis label (Date)
                    HStack {
                        Text("Date")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.leading, 30)
                }
                
                // Y-axis label (Total Reps)
                VStack {
                    Text("Total Reps")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees(-90))
                        .offset(x: -150, y: -100) // Adjust offset to align with Y-axis
                    Spacer()
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}
//
//struct ProgressView_Previews: PreviewProvider {
//    static var previews: some View {
//        let storage = TrainingSessionStorage()
//        let pullupsViewModel = PullupsTrainingViewModel(storage: storage)
//        let dipsViewModel = DipsTrainingViewModel(storage: storage)
//
//        ChooseView(pullupsViewModel: pullupsViewModel, dipsViewModel: dipsViewModel)
//    }
//}
