import Foundation

struct AppIconItem: Identifiable, Hashable {
    let id = UUID()
    let appName: String
    let symbolName: String
    let accentHex: String

    var initials: String {
        let words = appName.split(separator: " ")
        let letters = words.prefix(2).compactMap { $0.first }
        return String(letters)
    }
}
