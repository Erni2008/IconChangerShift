import SwiftUI
import UIKit

@MainActor
final class ThemeArtworkRenderer {
    func makeWallpaperImage(for theme: ThemePack) -> UIImage? {
        let content = WallpaperArtworkView(theme: theme, isHeroLayout: true)
            .frame(width: 1179, height: 2556)

        let renderer = ImageRenderer(content: content)
        renderer.scale = 3
        return renderer.uiImage
    }

    func makeIconImage(for icon: AppIconItem, theme: ThemePack) -> UIImage? {
        let content = AppIconArtworkView(icon: icon, theme: theme, side: 1024)
            .frame(width: 1024, height: 1024)

        let renderer = ImageRenderer(content: content)
        renderer.scale = 3
        return renderer.uiImage
    }
}
