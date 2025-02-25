import SwiftUI

@main
struct ProductivityApp: App {
    @StateObject private var habitManager = HabitManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(habitManager)
        }
    }
}
