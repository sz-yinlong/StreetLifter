import SwiftUI

struct StatsView: View {
   @State  var trainingSessions: [TrainingSession]
    var chartColor: Color

    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    StatsChart(trainingSessions: trainingSessions)
                        .foregroundStyle(chartColor)
                    Spacer()
                    TrainingHistoryList(trainingSessions: $trainingSessions)
                }
            }
        }
    }
}

struct TrainingHistoryList: View {
    @Binding var trainingSessions: [TrainingSession]
    
    var body: some View {
        VStack {
            List {
                Section(header: Text(R.string.localizable.trainingHistory())
                    .font(.subheadline)
                    .foregroundStyle(Color.primary))
                {
                    ForEach(trainingSessions, id: \.id) { session in
                        TrainingSessionRow(session: session)
                    }
                    .onDelete { indexSet in
                        trainingSessions.remove(atOffsets: indexSet)
                    }
                }
            }
            .padding(.trailing, 1)
            .listStyle(.inset)
        }
    }
   
}

struct TrainingSessionRow: View {
    var session: TrainingSession

    var body: some View {
        HStack {
            Text(session.date)
                .font(.system(size: Constants.fontDate))
            Spacer(minLength: 35)
            RepsAndWeightView(combinedRepsAndWeight: session.combinedRepsAndWeight)
        }
    }
}

struct RepsAndWeightView: View {
    var combinedRepsAndWeight: [RepsAndWeight]
    var body: some View {
        HStack(spacing: 8) {
            ForEach(combinedRepsAndWeight, id: \.id) { repsAndWeight in
                VStack {
                    Text("\(repsAndWeight.reps)")
                        .font(.system(size: Constants.fontPrimary))
                        .fontWeight(.medium)
                        .padding(.bottom, 5)
                    Text("\(repsAndWeight.weight) kg")
                        .font(.system(size: Constants.fontSecondary))
                        .foregroundColor(.secondary)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 5)
                .background(Color.secondary.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
            }
        }
    }
}

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(trainingSessions: [], chartColor: .blue)
    }
}
