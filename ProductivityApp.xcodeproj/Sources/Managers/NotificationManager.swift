import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error al solicitar permiso: \(error)")
            }
        }
    }

    func scheduleNotification(habitName: String) {
        let content = UNMutableNotificationContent()
        content.title = "Recordatorio"
        content.body = "No olvides tu hábito: \(habitName)"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
