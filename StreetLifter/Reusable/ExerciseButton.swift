
import SwiftUI

func exerciseButton<Destination: View>(destination: Destination, title: String, circleColor: Color, reps: Int) -> some View {
    NavigationLink(destination: destination) {
        VStack(alignment: .leading) {
            HStack {
                HStack {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                .padding(.vertical, 10)
                .padding(.leading, 16)
                Spacer()
            
                Image(systemName: "chevron.right")
                    .foregroundColor(.primary)
                    .font(.title3)
                    .offset(x: -10, y: 28)
            }
          
            VStack(alignment: .leading) {
                Text(R.string.localizable.lastSession())
                    .font(.callout)
                    .foregroundStyle(.secondary)
                    
                HStack(spacing: 5) {
                    Text("\(reps)")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .fontDesign(.rounded)
                     
                    Text(R.string.localizable.reps())
                        .foregroundStyle(.secondary)
                        .offset(y: 0.3)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 5, trailing: 0))
        }
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .navigationBarBackButtonHidden(true)
    }
}
