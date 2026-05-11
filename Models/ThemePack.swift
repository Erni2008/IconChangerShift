import Foundation

struct ThemePack: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let category: ThemeCategory
    let description: String
    let wallpaperImageName: String
    let previewImageName: String
    let wallpaper: WallpaperItem
    let icons: [AppIconItem]
    let isPremium: Bool
    let palette: ThemePalette

    func isLocked(for hasPremiumAccess: Bool) -> Bool {
        false
    }
}
