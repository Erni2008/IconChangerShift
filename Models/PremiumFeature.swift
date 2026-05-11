import Foundation

struct PremiumFeature: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let detail: String
    let symbolName: String
}
