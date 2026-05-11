# ThemeCatalogMVP

An iOS 17+ SwiftUI MVP inspired by ThemePack-style catalog apps, implemented to remain App Store-safe.

## What Is Included

- SwiftUI app shell with `NavigationStack`
- MVVM structure with local mock repositories and no backend dependency
- Onboarding gated by `AppStorage`
- Theme catalog with category chips, premium badges, preview cards, and detail pages
- Wallpaper and icon preview generation using SwiftUI-rendered artwork placeholders
- Photo Library saving for wallpapers and icons using the Photos framework
- Installation guide that explains the legal Shortcuts-based custom icon workflow
- Mock premium paywall prepared for later StoreKit 2 integration

## Folder Structure

```text
ThemeCatalogMVP/
├── App/
│   ├── RootView.swift
│   └── ThemeCatalogApp.swift
├── Components/
│   ├── ActionButton.swift
│   ├── AppBackgroundView.swift
│   ├── AppIconArtworkView.swift
│   ├── CategoryChipView.swift
│   ├── InstallationStepCard.swift
│   ├── LockedThemeOverlay.swift
│   ├── ThemeBadgeView.swift
│   ├── ThemeCardView.swift
│   └── WallpaperArtworkView.swift
├── Data/
│   ├── MockThemeRepository.swift
│   └── ThemeRepository.swift
├── Models/
│   ├── AppIconItem.swift
│   ├── InstallationGuideStep.swift
│   ├── PremiumFeature.swift
│   ├── ThemeCategory.swift
│   ├── ThemePack.swift
│   ├── ThemePalette.swift
│   └── WallpaperItem.swift
├── Services/
│   ├── PhotoLibrarySaver.swift
│   └── ThemeArtworkRenderer.swift
├── Support/
│   ├── AppStorageKeys.swift
│   └── Color+Hex.swift
├── ViewModels/
│   ├── HomeViewModel.swift
│   ├── PremiumViewModel.swift
│   └── ThemeDetailViewModel.swift
└── Views/
    ├── Guide/
    │   └── InstallationGuideView.swift
    ├── Home/
    │   └── HomeView.swift
    ├── Onboarding/
    │   └── OnboardingView.swift
    ├── Premium/
    │   └── PremiumView.swift
    └── ThemeDetail/
        ├── IconGalleryView.swift
        └── ThemeDetailView.swift
```

## Xcode Project Creation

1. Open Xcode.
2. Create a new project using `iOS > App`.
3. Use these settings:
   - Product Name: `ThemeCatalogMVP`
   - Interface: `SwiftUI`
   - Language: `Swift`
   - Minimum Deployment: `iOS 17.0`
4. After the project is created, remove the default sample Swift files if you want a clean target.
5. Drag the folders from this repository into the Xcode project navigator.
6. Choose `Copy items if needed`.
7. Make sure every `.swift` file is added to the main app target.
8. In the target settings, confirm the deployment target is still `iOS 17.0`.

## Photo Library Permission

Add the following Info.plist key in your app target:

- Key: `NSPhotoLibraryAddUsageDescription`
- Value: `This app saves wallpapers and icons to your photo library.`

You can add it in `Target > Info` or directly in `Info.plist`:

```xml
<key>NSPhotoLibraryAddUsageDescription</key>
<string>This app saves wallpapers and icons to your photo library.</string>
```

## Running The App

1. Open the Xcode project.
2. Select an iPhone simulator running iOS 17 or later.
3. Build and run with `Product > Run`.
4. Complete onboarding.
5. Open a theme pack and test:
   - wallpaper preview
   - icon gallery
   - save wallpaper
   - save icons
   - installation guide
   - mock premium flow

## App Store-Safe Constraints

- The app does not attempt to replace icons of other installed apps programmatically.
- The app does not claim that it can automatically apply a system wallpaper.
- The app only saves wallpapers and icon artwork to Photos.
- The guide explains the user-driven Shortcuts workflow for Home Screen customization.

## What Can Be Added Later

- StoreKit 2 subscriptions and entitlement syncing
- Firebase or Supabase backend for remote theme delivery
- AI wallpaper generation
- WidgetKit widgets and widget preview support
- Alternate icons for this app itself using `UIApplication.setAlternateIconName`

## Verification Note

The source is structured to compile in Xcode, but command-line typechecking could not be completed in this environment because the local `xcrun` setup does not currently expose the iPhone Simulator SDK. Final verification should be done by opening the project in Xcode and building against an installed iOS 17+ simulator/runtime.
# IconChangerShift
