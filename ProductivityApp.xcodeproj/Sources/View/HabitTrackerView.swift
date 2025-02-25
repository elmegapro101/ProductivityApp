import SwiftUI

struct HabitTrackerView: View {
    var habit: Habit

    var body: some View {
        VStack {
            Text("Seguimiento de \(habit.name)")
                .font(.largeTitle)
                .padding()

            Text("Progreso: \(habit.progress) días")
                .font(.headline)

            Button("Marcar como completado") {
                habit.markCompleted()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle(habit.name)
    }
}
