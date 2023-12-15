import Charts
import SwiftUI

struct StatsChart: View {
    
    var pullupsTrainingSesion: [TrainingSession]?
    var dipsTrainingSession: [TrainingSession]?
    
    
    var body: some View {
        VStack {
        Text("Statistcic")
            Chart {
                ForEach(pullupsTrainingSesion!, id: \.date) { session in
                    BarMark(x: .value("Date", session.date),
                            y: .value("Total reps", session.totalReps)
                    )
                    .foregroundStyle(by: .value("Total Reps", session.totalReps))
                            }
                
                            ForEach(dipsTrainingSession!, id: \.date) { session in
                        
                        
                        BarMark(x: .value("Date", session.date),
                                y: .value("Total reps", session.totalReps))
                        
                    }
                }
            }
            
        }
    }





#Preview {
    StatsView().environmentObject(BaseTrainingViewModel())
}
