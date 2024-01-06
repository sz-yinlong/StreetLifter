//
//  ProgramView.swift
//  StreetLifter
//
//  Created by Artem on 23.12.2023.
//

import SwiftUI

struct ProgramView: View {

    

    @EnvironmentObject var viewModel: BaseTrainingViewModel
   
    var body: some View {
       
        
        NavigationView {
            List {
                ForEach(viewModel.trainingLevels, id: \.title) { section in
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
                                
                             
                                    if viewModel.selectedLevel == level.level {
                                        Image(systemName: "checkmark").foregroundColor(Constants.acidGreen)
                                    } else {
                                        Image(systemName: "checkmark").foregroundColor(.clear)
                                    }
                                

                            }

                            .sensoryFeedback(.selection, trigger: viewModel.selectedLevel)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectedLevel = level.level
                                    print("Выбранный уровень: \(viewModel.selectedLevel)")
                                    self.viewModel.objectWillChange.send()
                                }
                               
                            }
                        }
                    }
                }
            }
            
            .navigationTitle(R.string.localizable.trainingProgram())
        }
    }
}

struct TrainingProgram_Previews: PreviewProvider {
    static var previews: some View {
        ProgramView()
            .environmentObject(TrainingSessionsManager())
    }
}
