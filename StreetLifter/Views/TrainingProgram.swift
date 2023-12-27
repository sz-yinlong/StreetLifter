//
//  TrainingProgram.swift
//  StreetLifter
//
//  Created by Artem on 23.12.2023.
//

import SwiftUI

struct TrainingProgram: View {
    @State private var trainingProgram: [TrainingSection] = [
        TrainingSection(title: "Beginner", levels: [
            TrainingLevel(level: "Level 1", sets: ["5", "4", "5", "4", "3"]),
            TrainingLevel(level: "Level 2", sets: ["6", "5", "5", "6", "4"]),
            TrainingLevel(level: "Level 3", sets: ["5", "6", "6", "5", "5"]),
        ]),
        TrainingSection(title: "Intermediate", levels: [
            TrainingLevel(level: "Level 4", sets: ["6", "5", "4", "6", "5"]),
            TrainingLevel(level: "Level 5", sets: ["8", "5", "5", "4", "4"]),
            TrainingLevel(level: "Level 6", sets: ["5", "9", "5", "5", "5"]),
        ]),
        TrainingSection(title: "Pro", levels: [
            TrainingLevel(level: "Level 7", sets: ["8", "6", "5", "6", "2"]),
            TrainingLevel(level: "Level 8", sets: ["8", "7", "6", "5", "2"]),
            TrainingLevel(level: "Level 9", sets: ["10", "6", "7", "8", "2"]),
        ]),
    ]

    @State private var selectedLevel = "Level 1"

    var body: some View {
        NavigationView {
            List {
                ForEach(trainingProgram, id: \.title) { section in
                    Section(header: Text(section.title).textCase(.uppercase)) {
                        ForEach(section.levels, id: \.level) { level in
                            HStack {
                                Text(level.level)
                                Spacer()
                                HStack {
                                    ForEach(level.sets, id: \.self) { set in
                                        Text(set)
                                    }
                                }
                                .padding(.trailing, 10)

                                if selectedLevel == level.level {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                } else {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.clear)
                                }
                            }
                            .sensoryFeedback(.selection, trigger: self.selectedLevel)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                self.selectedLevel = level.level
                                print("Выбранный уровень: \(self.selectedLevel)")
                                    
                            }
                        }
                    }
                }
            }
            .navigationTitle("Training Program")
        }
    }
}

struct TrainingSection {
    let title: String
    let levels: [TrainingLevel]
}

struct TrainingLevel {
    let level: String
    let sets: [String]
}

struct TrainingProgram_Previews: PreviewProvider {
    static var previews: some View {
        TrainingProgram()
    }
}
