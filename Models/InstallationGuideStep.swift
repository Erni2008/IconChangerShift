import Foundation

struct InstallationGuideStep: Identifiable, Hashable {
    let id = UUID()
    let number: Int
    let title: String
    let detail: String
    let symbolName: String
}
