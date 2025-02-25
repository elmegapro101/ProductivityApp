import Foundation

class HabitManager: ObservableObject {
    @Published var habits: [Habit] = []

    init() {
        loadHabits()
    }

    func addHabit(name: String) {
        let newHabit = Habit(name: name)
        habits.append(newHabit)
        saveHabits()
    }

    func saveHabits() {
        if let encoded = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(encoded, forKey: "habits")
        }
    }

    func loadHabits() {
        if let savedHabits = UserDefaults.standard.data(forKey: "habits"),
           let decoded = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
            habits = decoded
        }
    }
}
