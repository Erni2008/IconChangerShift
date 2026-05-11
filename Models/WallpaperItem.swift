import Foundation

struct WallpaperItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let gradientHexes: [String]
}
