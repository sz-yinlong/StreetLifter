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
                Button("See All") { }
                    .font(.footnote)
                    .foregroundStyle(.blue)
            }
          
                Text(R.string.localizable.lastSevenSessions())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            Chart {
              
                ForEach(Array(trainingSession.suffix(7).enumerated()), id: \.element) { index ,session  in
                    
                    LineMark(
                        x: .value("Date", session.date),
                        y: .value("Total Reps", session.totalReps)
                    )
                    if index == trainingSession.suffix(7).count - 1 {
                               PointMark(
                                   x: .value("Date", session.date),
                                   y: .value("Total Reps", session.totalReps)
                               )
                               .annotation {
                                   Text("\(session.totalReps)")
                                       .foregroundColor(.green)
                                       .font(.caption)
                                           }
                               .cornerRadius(3)
                           }
                       }
                       .foregroundStyle(ColorConstants.chartOrange)
                       .interpolationMethod(.monotone)
                   }
     
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
       
    }
        
}


#Preview {
    TabBar()
}
