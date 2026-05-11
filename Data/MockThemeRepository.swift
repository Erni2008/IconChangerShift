import Foundation

struct MockThemeRepository: ThemeRepository {
    func fetchThemes() -> [ThemePack] {
        MockThemeData.themes
    }
}

enum MockThemeData {
    static let installationSteps: [InstallationGuideStep] = [
        InstallationGuideStep(
            number: 1,
            title: "Open Shortcuts",
            detail: "Launch the Shortcuts app on your iPhone to begin creating a custom Home Screen icon.",
            symbolName: "square.grid.2x2"
        ),
        InstallationGuideStep(
            number: 2,
            title: "Create a Shortcut",
            detail: "Tap the plus button in the top-right corner to start a new shortcut.",
            symbolName: "plus.circle"
        ),
        InstallationGuideStep(
            number: 3,
            title: "Add Open App",
            detail: "Choose Add Action, search for Open App, and add it to the shortcut.",
            symbolName: "app.badge"
        ),
        InstallationGuideStep(
            number: 4,
            title: "Choose the App",
            detail: "Tap App in the action and select the app you want this icon to open.",
            symbolName: "hand.tap"
        ),
        InstallationGuideStep(
            number: 5,
            title: "Add to Home Screen",
            detail: "Tap the share button, then choose Add to Home Screen to prepare the icon.",
            symbolName: "square.and.arrow.up"
        ),
        InstallationGuideStep(
            number: 6,
            title: "Pick Your Custom Icon",
            detail: "Tap the placeholder icon, choose photos, and select the icon image you saved from this app.",
            symbolName: "photo.on.rectangle"
        ),
        InstallationGuideStep(
            number: 7,
            title: "Name and Save",
            detail: "Rename the shortcut if you want, tap Add, and place it on your Home Screen.",
            symbolName: "checkmark.circle"
        )
    ]

    static let themes: [ThemePack] = [
        makeTheme(
            name: "Neon Cyber",
            category: .neon,
            description: "Electric gradients, glowing glyphs, and a vivid late-night city energy.",
            isPremium: false,
            palette: ThemePalette(
                primaryHex: "#00F5D4",
                secondaryHex: "#7B2FF7",
                accentHex: "#FF4D8D",
                backgroundHex: "#0B1020",
                symbolName: "sparkles"
            )
        ),
        makeTheme(
            name: "Dark Titanium",
            category: .dark,
            description: "A sleek metallic aesthetic with graphite tones and sharp highlights.",
            isPremium: false,
            palette: ThemePalette(
                primaryHex: "#4B5563",
                secondaryHex: "#111827",
                accentHex: "#D1D5DB",
                backgroundHex: "#06070A",
                symbolName: "circle.hexagongrid"
            )
        ),
        makeTheme(
            name: "Pink Aura",
            category: .pink,
            description: "Soft pink light, glowing depth, and playful candy-glass surfaces.",
            isPremium: false,
            palette: ThemePalette(
                primaryHex: "#FF77C8",
                secondaryHex: "#FFB5E8",
                accentHex: "#FF4F9A",
                backgroundHex: "#2F153A",
                symbolName: "heart.fill"
            )
        ),
        makeTheme(
            name: "Minimal White",
            category: .minimal,
            description: "Bright paper-like surfaces, restrained contrast, and crisp icon framing.",
            isPremium: false,
            palette: ThemePalette(
                primaryHex: "#F7F7F5",
                secondaryHex: "#D6D3D1",
                accentHex: "#6B7280",
                backgroundHex: "#E7E5E4",
                symbolName: "square.split.diagonal"
            )
        ),
        makeTheme(
            name: "Anime Dream",
            category: .anime,
            description: "Pastel skies, dramatic color washes, and a dreamy illustrated vibe.",
            isPremium: false,
            palette: ThemePalette(
                primaryHex: "#6EE7F9",
                secondaryHex: "#A78BFA",
                accentHex: "#FB7185",
                backgroundHex: "#1F2140",
                symbolName: "star"
            )
        ),
        makeTheme(
            name: "Purple Galaxy",
            category: .neon,
            description: "Nebula purples, deep-space contrast, and glossy cosmic icon lighting.",
            isPremium: false,
            palette: ThemePalette(
                primaryHex: "#8B5CF6",
                secondaryHex: "#312E81",
                accentHex: "#C084FC",
                backgroundHex: "#09090F",
                symbolName: "moon.stars.fill"
            )
        ),
        makeTheme(
            name: "Green Matrix",
            category: .cyberpunk,
            description: "Code-rain greens, sharp UI chrome, and hacker-screen atmosphere.",
            isPremium: false,
            palette: ThemePalette(
                primaryHex: "#22C55E",
                secondaryHex: "#14532D",
                accentHex: "#86EFAC",
                backgroundHex: "#04130A",
                symbolName: "terminal"
            )
        ),
        makeTheme(
            name: "Blue Ocean",
            category: .minimal,
            description: "A calm marine palette with airy spacing and fluid icon containers.",
            isPremium: false,
            palette: ThemePalette(
                primaryHex: "#38BDF8",
                secondaryHex: "#0F766E",
                accentHex: "#BAE6FD",
                backgroundHex: "#082F49",
                symbolName: "water.waves"
            )
        )
    ]

    private static func makeTheme(
        name: String,
        category: ThemeCategory,
        description: String,
        isPremium: Bool,
        palette: ThemePalette
    ) -> ThemePack {
        ThemePack(
            name: name,
            category: category,
            description: description,
            wallpaperImageName: "\(name.replacingOccurrences(of: " ", with: "").lowercased())Wallpaper",
            previewImageName: "\(name.replacingOccurrences(of: " ", with: "").lowercased())Preview",
            wallpaper: WallpaperItem(
                title: name,
                subtitle: category.title,
                gradientHexes: [palette.primaryHex, palette.secondaryHex, palette.backgroundHex]
            ),
            icons: makeIcons(primaryAccent: palette.accentHex, secondaryAccent: palette.primaryHex),
            isPremium: isPremium,
            palette: palette
        )
    }

    private static func makeIcons(primaryAccent: String, secondaryAccent: String) -> [AppIconItem] {
        [
            AppIconItem(appName: "Instagram", symbolName: "camera.circle.fill", accentHex: primaryAccent),
            AppIconItem(appName: "TikTok", symbolName: "music.note.tv.fill", accentHex: secondaryAccent),
            AppIconItem(appName: "Telegram", symbolName: "paperplane.circle.fill", accentHex: primaryAccent),
            AppIconItem(appName: "Safari", symbolName: "safari.fill", accentHex: secondaryAccent),
            AppIconItem(appName: "YouTube", symbolName: "play.rectangle.fill", accentHex: primaryAccent),
            AppIconItem(appName: "Spotify", symbolName: "waveform.circle.fill", accentHex: secondaryAccent),
            AppIconItem(appName: "Settings", symbolName: "gearshape.fill", accentHex: primaryAccent),
            AppIconItem(appName: "Messages", symbolName: "message.fill", accentHex: secondaryAccent)
        ]
    }
}
