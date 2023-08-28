

import SwiftUI

struct BaseTrainingView<ViewModel: BaseTrainingViewModel,TrainingViewModelProtocol>: View {
    
    @StateObject var pullupsViewModel: PullupsTrainingViewModel
    @StateObject var dipsViewModel: DipsTrainingViewModel
    @StateObject var viewModel: BaseTrainingViewModel
    @StateObject var storage = TrainingSessionStorage()
    
    @State private var selectedWeightIndex = 0
  
    init(viewModel: ViewModel) {
            let storage = TrainingSessionStorage()
            
            _viewModel = StateObject(wrappedValue: viewModel)
            _pullupsViewModel = StateObject(wrappedValue: PullupsTrainingViewModel(storage: storage))
            _dipsViewModel = StateObject(wrappedValue: DipsTrainingViewModel(storage: storage))
        }
    
    var body: some View {
        
        NavigationStack {
            if viewModel.trainingCompleted {
                
                VStack {
                                  Spacer()
                                  Image(systemName: "trophy")
                                      .font(Font.system(size: 50))
                                      .padding()
                                  Text("Good job!\n You've done \(viewModel.lastSessionTotalReps ?? 0) reps.")
                                      .font(.title)
                                      .multilineTextAlignment(.center)
                                  Spacer()
                    NavigationLink(destination: ChooseView(pullupsViewmodel: pullupsViewModel, dipsViewModel: dipsViewModel)) {
                        Color.black
                            .frame(maxWidth: 250, maxHeight: 50)
                            .cornerRadius(10)
                            .overlay(
                                Text("Main")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .padding(8)
                            )
                    }
                    }
         
            } else {
                VStack {
                    Text("Progress:")
                        .font(.title)
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.currentSessionReps, id: \.self) { reps in
                                Text("\(reps)")
                                    .frame(width: 20, height: 15)
                                    .padding(20)
                                    .background(Color.secondary.opacity(0.1))
                                    .cornerRadius(8)
                                
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    Spacer()
                    
                    Text("\(viewModel.reps)")
                        .font(.system(size: 70))
                        .bold()
                    
                    
                    Spacer()
                    
                    HStack (alignment: .center){
                        Button(action: {
                            viewModel.decrementReps()
                        }) {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.primary)
                                .font(.system(size: 50))
                            
                        }
                        Spacer()
                        
                        
                        Text("Reps")
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.incrementReps()
                        }) {
                            Image(systemName: "plus.circle")
                                .foregroundColor(.primary)
                                .font(.system(size: 50))
                        }
                    }
                    .font(.largeTitle)
                    .padding()
                    
                    HStack {
                        Text("Add Weight")
                            .font(.system(size: 30))
                        
                        
                        Picker("Weight", selection: $selectedWeightIndex) {
                            ForEach(0..<viewModel.availableWeights.count) {
                                index in
                                Text("\(viewModel.availableWeights[index])kg")
                                    .tag(index)
                            }
                        }
                        .frame(width: 100, height: 100)
                        .pickerStyle(WheelPickerStyle())
                        .padding()
                        
                    }
                    
                    VStack {
                        
                        Button(action: {
                            
                            if viewModel.canAddSet {
                                viewModel.trainingCompleted = false
                            } else {
                                viewModel.trainingCompleted = true
                                viewModel.saveTrainingSession()
                                
                            }
                            viewModel.saveRepsForCurrentSession()
                        }) {
                            Text("Done")
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: 300)
                                .frame(maxHeight: 50)
                                .cornerRadius(10)
                            
                        }
                        .background(Color.primary)
                        .cornerRadius(10)
                    }
                    
                }
                .padding()
            }
        }
}
}


struct BaseTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        let storage = TrainingSessionStorage()
        let viewModel = BaseTrainingViewModel(storage: storage, trainingSessionsKey: "yourKeyHere")
        
        // Pass the view model instance to the BaseTrainingView preview
        BaseTrainingView<BaseTrainingViewModel, Any>(viewModel: viewModel)
    }
}

