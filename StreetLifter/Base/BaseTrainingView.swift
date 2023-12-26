

import SwiftUI

struct BaseTrainingView<ViewModel: BaseTrainingViewModel, TrainingViewModelProtocol>: View {
    @StateObject var viewModel: BaseTrainingViewModel
    @StateObject var storage = TrainingSessionStorage()
 
    var backgroundColor: Color
    
    init(viewModel: ViewModel, backgroundColor: Color = .secondary) {
        let storage = TrainingSessionStorage()
        
        _viewModel = StateObject(wrappedValue: viewModel)
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        NavigationStack {
            if #available(iOS 17.0, *) {
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
                        NavigationLink(destination: MainView()) {
                            Color.blue
                                .frame(maxWidth: 300, maxHeight: 50)
                                .cornerRadius(10)
                                .overlay(
                                    Text(R.string.localizable.main())
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .padding(8)
                                )
                        }
                    }
                    .onDisappear {
                        viewModel.startNewSession()
                    }
                } else {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.currentSessionReps, id: \.self) { reps in
                                    Text("\(reps)")
                                        .frame(width: 25, height: 15)
                                        .padding(20)
                                        .foregroundStyle(backgroundColor)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .background(Color.secondary.opacity(0.04))
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.horizontal, 5)
                        }
                        Spacer()
                        Text("\(viewModel.reps)")
                            .font(.system(size: 70))
                            .foregroundStyle(.primary)
                            .bold()
                        
                        Spacer()
                        
                        HStack(alignment: .center) {
                            Button(action: {
                                viewModel.decrementReps()
                            }) {
                                Image(systemName: "minus.circle")
                                    .foregroundColor(.primary)
                                    .font(.system(size: 50))
                            }
                            Spacer()
                            
                            Text(R.string.localizable.reps())
                            
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
                            HStack {
                                Toggle("", isOn: $viewModel.isWeightAdded)
                                    .labelsHidden()
                                Text(R.string.localizable.addWeight())
                            }
                            Picker("Weight", selection: $viewModel.selectedWeightIndex) {
                                ForEach(0 ..< viewModel.availableWeights.count, id: \.self) {
                                    index in
                                    Text("\(viewModel.availableWeights[index])kg").tag(index)
                                }
                            }
                            .onChange(of: viewModel.selectedWeightIndex, perform: { newValue in
                                viewModel.tempSelectedWeight = viewModel.availableWeights[newValue]
                                print("Выбранный вес: \(viewModel.availableWeights[newValue])кг")
                            })
                            .disabled(!viewModel.isWeightAdded)
                            .frame(width: 100, height: 100)
                            .pickerStyle(WheelPickerStyle())
                            .padding()
                            .opacity(viewModel.isWeightAdded ? 1 : 0.2)
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
                                viewModel.saveWeightForCurrentSession()
                            }) {
                                Text(R.string.localizable.done()
                                )
                                .foregroundColor(.white)
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: 300)
                                .frame(maxHeight: 50)
                                .cornerRadius(10)
                            }
                            .background(.blue)
                            .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(TrainingSessionsManager())
}

// 5-0/6-8/7-10/8-12/4-0/
