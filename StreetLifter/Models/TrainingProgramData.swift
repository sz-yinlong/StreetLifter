//TrainingprogrmaList.swift
import Foundation

struct TrainingProgramList {
    
    @State private var trainingLevels: [TrainingSection] = [
        TrainingSection(title: "Beginner", levels: [
            TrainingLevel(level: "Level 1", sets: [5, 4, 5, 4, 3]),
            TrainingLevel(level: "Level 2", sets: [6, 5, 5, 6, 4]),
            TrainingLevel(level: "Level 3", sets: [5, 6, 6, 5, 5]),
            TrainingLevel(level: "Level 4", sets: [4, 4, 5, 5, 4]),
            TrainingLevel(level: "Level 5", sets: [6, 5, 4, 5, 4]), // Новый уровень
            TrainingLevel(level: "Level 6", sets: [5, 6, 6, 5, 4]), // Новый уровень
            TrainingLevel(level: "Level 7", sets: [4, 5, 5, 6, 3]), // Новый уровень
        ]),
        TrainingSection(title: "Intermediate", levels: [
            TrainingLevel(level: "Level 4", sets: [6, 5, 4, 6, 5]),
            TrainingLevel(level: "Level 5", sets: [8, 5, 5, 4, 4]),
            TrainingLevel(level: "Level 6", sets: [5, 9, 5, 5, 5]),
            TrainingLevel(level: "Level 7", sets: [7, 6, 6, 5, 4]),
            TrainingLevel(level: "Level 8", sets: [8, 7, 6, 5, 4]), // Новый уровень
            TrainingLevel(level: "Level 9", sets: [7, 8, 7, 6, 5]), // Новый уровень
            TrainingLevel(level: "Level 10", sets: [6, 7, 8, 8, 4]), // Новый уровень
        ]),
        TrainingSection(title: "Pro", levels: [
            TrainingLevel(level: "Level 7", sets: [8, 6, 5, 6, 2]),
            TrainingLevel(level: "Level 8", sets: [8, 7, 6, 5, 2]),
            TrainingLevel(level: "Level 9", sets: [10, 6, 7, 8, 2]),
            TrainingLevel(level: "Level 10", sets: [9, 8, 8, 7, 2]),
            TrainingLevel(level: "Level 11", sets: [7, 6, 5, 6, 3]), // Новый уровень
            TrainingLevel(level: "Level 12", sets: [8, 7, 7, 7, 3]), // Новый уровень
            TrainingLevel(level: "Level 13", sets: [10, 9, 8, 8, 4]), // Новый уровень
        ])
    ]
}


