import SwiftUI

struct ContentView: View {
    @EnvironmentObject var habitManager: HabitManager
    @State private var habitName = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Nuevo hábito", text: $habitName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Agregar Hábito") {
                    if !habitName.isEmpty {
                        habitManager.addHabit(name: habitName)
                        habitName = ""
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                List(habitManager.habits) { habit in
                    NavigationLink(destination: HabitTrackerView(habit: habit)) {
                        Text(habit.name)
                    }
                }
            }
            .navigationTitle("Gestor de Hábitos")
        }
    }
}
