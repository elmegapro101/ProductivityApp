import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    var name: String
    var progress: Int = 0

    mutating func markCompleted() {
        progress += 1
    }
}
