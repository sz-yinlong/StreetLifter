//
//  ProgramView.swift
//  StreetLifter
//
//  Created by Artem on 23.12.2023.
//

import SwiftUI

struct ProgramView: View {
//    @StateObject private var trainingData = TrainingProgramData()
    
    
    @EnvironmentObject var trainingSessionsManager: TrainingSessionsManager
   
    var body: some View {
       
        
        NavigationView {
            List {
                ForEach(trainingSessionsManager.pullupsViewModel.trainingLevels, id: \.title) { section in
                    Section(header: Text(section.title).textCase(.uppercase)) {
                        ForEach(section.levels, id: \.level) { level in
                            HStack {
                                Text(level.level)
                                Spacer()
                                HStack(spacing: 8) {
                                    ForEach(level.sets.indices, id: \.self) { index in
                                        Text("\(level.sets[index])")
                                            .frame(minWidth: 15, alignment: .trailing)
                                    }
                                }
                                .padding(.trailing, 10)
                                
                             
                                    if trainingSessionsManager.pullupsViewModel.selectedLevel == level.level {
                                        Image(systemName: "checkmark").foregroundColor(.blue)
                                    } else {
                                        Image(systemName: "checkmark").foregroundColor(.clear)
                                    }
                                

                            }

                            .sensoryFeedback(.selection, trigger: trainingSessionsManager.pullupsViewModel.selectedLevel)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                trainingSessionsManager.pullupsViewModel.selectedLevel = level.level
                                print("Выбранный уровень: \(trainingSessionsManager.pullupsViewModel.selectedLevel)")
                                self.trainingSessionsManager.objectWillChange.send()// Добавьте эту строку
                            }
                        }
                    }
                }
            }
            
            .navigationTitle("Training Program")
        }
    }
}

struct TrainingProgram_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView()
            .environmentObject(TrainingSessionsManager())
    }
}
