import Combine
import Foundation

final class PremiumViewModel: ObservableObject {
    let heroTheme: ThemePack
    let features: [PremiumFeature]

    init(
        heroTheme: ThemePack = MockThemeData.themes[5],
        features: [PremiumFeature] = [
            PremiumFeature(
                title: "Unlock all themes",
                detail: "Browse every pack without locked previews blocking artwork downloads.",
                symbolName: "sparkles.rectangle.stack.fill"
            ),
            PremiumFeature(
                title: "Premium icon packs",
                detail: "Access higher-end icon treatments for polished Shortcuts setups.",
                symbolName: "app.badge.fill"
            ),
            PremiumFeature(
                title: "Exclusive wallpapers",
                detail: "Save premium gradient wallpapers designed for a more editorial look.",
                symbolName: "photo.fill.on.rectangle.fill"
            ),
            PremiumFeature(
                title: "New weekly themes",
                detail: "The purchase surface is ready for a future content cadence with StoreKit 2.",
                symbolName: "calendar.badge.plus"
            )
        ]
    ) {
        self.heroTheme = heroTheme
        self.features = features
    }
}
