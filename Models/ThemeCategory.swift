import Foundation

enum ThemeCategory: String, CaseIterable, Identifiable, Hashable {
    case all = "All"
    case neon = "Neon"
    case minimal = "Minimal"
    case dark = "Dark"
    case anime = "Anime"
    case cyberpunk = "Cyberpunk"
    case pink = "Pink"

    var id: String { rawValue }

    var title: String { rawValue }
}
