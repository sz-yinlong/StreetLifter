import SwiftUI
import Charts




struct BarChart: View {
    var trainingSession: [TrainingSession]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(R.string.localizable.progress())
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
          
                Text(R.string.localizable.lastSevenSessions())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            Chart {
              
                ForEach(Array(trainingSession.suffix(7).enumerated()), id: \.element) { _ ,session in
                    
                    LineMark(
                        x: .value("Date", session.date),
                        y: .value("Total Reps", session.totalReps)
                    )
//                    PointMark(
//                        x: .value("Date", session.date),
//                        y: .value("Total Reps", session.totalReps)
//                        )
                    .cornerRadius(3)
                }
                .foregroundStyle(ColorConstants.chartOrange)
                .interpolationMethod(.catmullRom)
            }
     
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
       
    }
        
}


#Preview {
    TabBar()
}
