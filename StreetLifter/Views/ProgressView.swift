import SwiftUI
import Charts




struct BarChart: View {
    var trainingSession: [TrainingSession]
    
    var body: some View {
        VStack(alignment: .center) {
            Text(R.string.localizable.progress())
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(ColorConstants.buttonColor.opacity(0.7))
            
            Chart {
                ForEach(Array(trainingSession.suffix(7).enumerated()), id: \.element) { _ ,session in
                    BarMark(
                        x: .value("Date", session.date),
                        y: .value("Total Reps", session.totalReps)
                    )
                    
                    .foregroundStyle(ColorConstants.buttonColor.opacity(0.7))
                    
                    .cornerRadius(3)
                }
            }
            .padding()
        }
        .frame(width: 330, height: 150)
        
       
    }
    
}



#Preview {
    TabBar()
}
