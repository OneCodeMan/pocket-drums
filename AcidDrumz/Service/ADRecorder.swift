//
//  ADRecorder.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-01.
//
import SwiftUI
import ReplayKit

struct RPDemoView: View {
    let recorder = RPScreenRecorder.shared()

    @State private var isRecording = false
    @State private var isShowPreviewVideo = false
    @State private var rp: RPPreviewView!

    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    if !isRecording {
                        startRecord()
                    } else {
                        stopRecord()
                    }
                }) {
                    Image(systemName: isRecording ? "stop.circle" : "video.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }

            if isShowPreviewVideo {
                rp
                    .transition(.move(edge: .bottom))
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }

    func startRecord() {
        guard recorder.isAvailable else {
            print("Recording is not available at this time.")
            return
        }

        if !recorder.isRecording {
            recorder.startRecording { error in
                guard error == nil else {
                    print("There was an error starting the recording: \(error!)")
                    return
                }

                print("Started Recording Successfully")
                isRecording = true
            }
        }
    }

    func stopRecord() {
        recorder.stopRecording { preview, error in
            print("Stopped recording")
            isRecording = false

            guard let preview = preview else {
                print("Preview controller is not available.")
                return
            }

            rp = RPPreviewView(rpPreviewViewController: preview, isShow: $isShowPreviewVideo)

            withAnimation {
                isShowPreviewVideo = true
            }
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
