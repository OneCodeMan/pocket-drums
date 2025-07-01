//
//  ADRecorder.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-01.
//
import SwiftUI
import ReplayKit
import AVFoundation

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
