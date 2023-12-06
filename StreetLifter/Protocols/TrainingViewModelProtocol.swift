
import Foundation

protocol TrainingViewModelProtocol: ObservableObject {

    var trainingSessionsKey: String { get }
    func shouldDisplayChart() -> Bool
    
}


