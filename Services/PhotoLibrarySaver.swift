import Foundation
import Photos
import UIKit

enum PhotoSaveError: LocalizedError {
    case permissionDenied
    case saveFailed

    var errorDescription: String? {
        switch self {
        case .permissionDenied:
            return "Photo Library access was denied. Please allow access in Settings to save wallpapers and icons."
        case .saveFailed:
            return "The image could not be saved to the photo library."
        }
    }
}

@MainActor
final class PhotoLibrarySaver {
    func save(images: [UIImage]) async throws {
        let status = await requestAuthorization()

        guard status == .authorized || status == .limited else {
            throw PhotoSaveError.permissionDenied
        }

        for image in images {
            try await save(image: image)
        }
    }

    private func requestAuthorization() async -> PHAuthorizationStatus {
        await withCheckedContinuation { continuation in
            PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
                continuation.resume(returning: status)
            }
        }
    }

    private func save(image: UIImage) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }, completionHandler: { success, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if success {
                    continuation.resume()
                } else {
                    continuation.resume(throwing: PhotoSaveError.saveFailed)
                }
            })
        }
    }
}
