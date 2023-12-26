import SwiftUI

enum Constants {
    // MARK: - CGFloat
    static let sessionDateWidth = CGFloat(80)
    static let sessionSpacing = CGFloat(4)
    static let sessionVStackWidth = CGFloat(28)
    static let sessionVPaddingVertical = CGFloat(2)
    static let sessionVPaddingHorizontal = CGFloat(8)
    static let sessionVCornerRadius = CGFloat(8)
    static let sessionHAlignmentGuide = CGFloat(275)
    static let buttonMaxWidth = CGFloat(350)
    static let buttonMaxHeight = CGFloat(120)
    static let buttonCornerRadius = CGFloat(10)
    static let fontPrimary = CGFloat(12)
    static let fontSecondary = CGFloat(10)
    static let fontDate = CGFloat(14)
    static let opacity = CGFloat(0.1)
    
    // MARK: - Colors
    static let tomato = Color(red: 255 / 255, green: 82 / 255, blue: 51 / 255)
    static let bitterSweet = Color(red: 255 / 255, green: 94 / 255, blue: 91 / 255, opacity: 1)
    static let robinEggBlue = Color(red: 0 / 255, green: 206 / 255, blue: 203 / 255, opacity: 1)
    static let buttonColor = Color(red: 79 / 255, green: 93 / 255, blue: 117 / 255, opacity: 1)
    static let chartOrange = Color(red: 255 / 255, green: 72 / 255, blue: 2 / 255, opacity: 1)
    static let acidGreen = Color(red: 165 / 255, green: 248 / 255, blue: 0 / 255, opacity: 1)
    
    static let trainingBackgroundGradient = LinearGradient(
           gradient: Gradient(colors: [.red, .orange.opacity(0.5), Color.secondary.opacity(0.1)]),
           startPoint: .top,
           endPoint: .bottom
       )
}

struct Constants_Previews: PreviewProvider {
    static var previews: some View {
        StatsPageTabView()
            .environmentObject(TrainingSessionsManager())
    }
}
