import Foundation

struct NFCReadHistory: Codable {
    var id: UUID
    var date: Date
    var serialNumber: String
    var type: String
    var tech: String
    var payload: String

    static let userDefaultsKey = "NFCReadHistory"

    static func save(_ history: NFCReadHistory) {
        var histories = retrieveAll()
        histories.append(history)
        if let data = try? JSONEncoder().encode(histories) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }

    static func retrieveAll() -> [NFCReadHistory] {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let histories = try? JSONDecoder().decode([NFCReadHistory].self, from: data) {
            return histories
        }
        return []
    }
}
