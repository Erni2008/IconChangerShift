import Foundation

protocol ThemeRepository {
    func fetchThemes() -> [ThemePack]
}
