
import SwiftUI


struct ChooseView: View {
    
    @ObservedObject var pullupsViewmodel: PullupsTrainingViewModel
    @ObservedObject var dipsViewModel: DipsTrainingViewModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 40) {
                    Text("Previous Training")
                        .font(.headline)
                    HStack {
                        VStack (alignment: .leading) {
                          
                          
                            Text("Pullups")
                                

                            if let lastTotalRepsPullups = pullupsViewmodel.lastSessionTotalReps {

                                Text("Reps: \(lastTotalRepsPullups)")
                            } else {
                                Text("Reps")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Text("Weight: ~20kg")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    
                        
                        VStack (alignment: .leading) {
                            
                            Text("Dips")
                            
                            if let lastTotalRepsDips = dipsViewModel.lastSessionTotalReps {
                                Text("Rps: \(lastTotalRepsDips)")
                            } else {
                                
                                
                                
                                Text("Reps: ")
                                    .font(.subheadline)
                                
                                    .foregroundColor(.secondary)
                            }
                            
                            Text("Weight: ~25kg")
                                .font(.subheadline)
                                
                                .foregroundColor(.secondary)
                        }
                    }
                }
    
                
                .padding()
                .frame(width: .infinity, height: 150)
                
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 10)
                .padding(.top) // Adds some space above the section
                
                Spacer()
                
                Text("Choose your Exercise")
                    .font(.headline)
                    .fontWeight(.regular)
                    .padding(.bottom)
              
                exerciseButton(destination: PullupsExerciseView(), image: "pull-ups", title: "Pull-ups")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    
                
                exerciseButton(destination: DipsExerciseView(), image: "dips", title: "Dips")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    
                
                // Last Training Info Section
                
            }
            .padding(.horizontal, 10)
            
        }.navigationBarHidden(true)
        
    }

    
    
    
    private func exerciseButton<Destination: View>(destination: Destination, image: String, title: String) -> some View {
        
        NavigationLink(destination: destination) {
            
            
            
            VStack(alignment: .leading) {
                
                HStack {
                    Image(image)
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                    
                }
                .padding()
                .background(Color.black.opacity(1))
                .cornerRadius(12)
                .navigationBarBackButtonHidden(true)
               
               
            }
           // Increased frame height to accommodate the text
            
        }
        .buttonStyle(PlainButtonStyle())
    }
    
}


struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        let storage = TrainingSessionStorage()
        let pullupsVM = PullupsTrainingViewModel(storage: storage)
        let dipsVM = DipsTrainingViewModel(storage: storage)

        ChooseView(pullupsViewmodel: pullupsVM, dipsViewModel: dipsVM)
    }
}
