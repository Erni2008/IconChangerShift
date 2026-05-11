import Combine
import Foundation
import UIKit

struct ThemeActionAlert: Identifiable {
    let id = UUID()
    let title: String
    let message: String
}

@MainActor
final class ThemeDetailViewModel: ObservableObject {
    let theme: ThemePack
    @Published var alert: ThemeActionAlert?
    @Published var isSaving = false

    private let photoSaver = PhotoLibrarySaver()
    private let renderer = ThemeArtworkRenderer()

    init(theme: ThemePack) {
        self.theme = theme
    }

    func saveWallpaper() async {
        guard let image = renderer.makeWallpaperImage(for: theme) else {
            alert = ThemeActionAlert(title: "Unable to Render", message: "The wallpaper preview could not be generated.")
            return
        }

        await save(images: [image], successMessage: "Wallpaper saved to your photo library.")
    }

    func saveIcon(_ icon: AppIconItem) async {
        guard let image = renderer.makeIconImage(for: icon, theme: theme) else {
            alert = ThemeActionAlert(title: "Unable to Render", message: "The icon preview could not be generated.")
            return
        }

        await save(images: [image], successMessage: "\(icon.appName) icon saved to your photo library.")
    }

    func saveAllIcons() async {
        let images = theme.icons.compactMap { renderer.makeIconImage(for: $0, theme: theme) }

        guard !images.isEmpty else {
            alert = ThemeActionAlert(title: "No Icons Saved", message: "There were no icons available to save.")
            return
        }

        await save(images: images, successMessage: "Saved \(images.count) icons to your photo library.")
    }

    private func save(images: [UIImage], successMessage: String) async {
        isSaving = true
        defer { isSaving = false }

        do {
            try await photoSaver.save(images: images)
            alert = ThemeActionAlert(title: "Saved", message: successMessage)
        } catch {
            alert = ThemeActionAlert(
                title: "Save Failed",
                message: error.localizedDescription
            )
        }
    }
}
