//
//  ADRecorder.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-01.
//
import SwiftUI
import ReplayKit
import AVFoundation

func extractAudio(from url: URL, completion: @escaping (URL?) -> Void) {
    let asset = AVURLAsset(url: url)
    
    guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetAppleM4A) else {
        print("Failed to create export session")
        completion(nil)
        return
    }

    let outputURL = FileManager.default.temporaryDirectory.appendingPathComponent("ExtractedAudio.m4a")

    // Remove file if it exists
    try? FileManager.default.removeItem(at: outputURL)

    exportSession.outputURL = outputURL
    exportSession.outputFileType = .m4a

    exportSession.exportAsynchronously {
        switch exportSession.status {
        case .completed:
            print("Audio exported successfully to \(outputURL)")
            completion(outputURL)
        case .failed, .cancelled:
            print("Export failed: \(exportSession.error?.localizedDescription ?? "Unknown error")")
            completion(nil)
        default:
            break
        }
    }
}


struct RPPreviewView: UIViewControllerRepresentable {
    let rpPreviewViewController: RPPreviewViewController
    @Binding var isShow: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> RPPreviewViewController {
        rpPreviewViewController.previewControllerDelegate = context.coordinator
        rpPreviewViewController.modalPresentationStyle = .fullScreen
        return rpPreviewViewController
    }

    func updateUIViewController(_ uiViewController: RPPreviewViewController, context: Context) {}

    class Coordinator: NSObject, RPPreviewViewControllerDelegate {
        var parent: RPPreviewView

        init(_ parent: RPPreviewView) {
            self.parent = parent
        }

        func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
            withAnimation {
                parent.isShow = false
            }
        }
    }
}
