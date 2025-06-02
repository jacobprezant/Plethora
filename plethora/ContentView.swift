//
//  ContentView.swift
//  plethora
//
//  Created by Jacob Prezant on 5/31/25.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType { static let mobileprovision = UTType(filenameExtension: "mobileprovision", conformingTo: .data) ?? .data }

extension URLResourceKey {
    static let isUbiquitousItemDownloadedKey = URLResourceKey("isUbiquitousItemDownloaded")
}

struct ContentView: View {
@State private var showPicker = false
@State private var showIPA = false
@State private var ipaURL: URL?
@State private var provisionURL: URL?
@State private var origID: String?
@State private var newID: String?

    var body: some View {
        VStack(spacing: 20) {
            if provisionURL == nil {
                Button(".mobileprovision") { showPicker = true }
            } else if ipaURL == nil {
                Button(".ipa") { showIPA = true }
            } else {
                VStack {
                    Text("Done")
                    Link("Plethora", destination: URL(string: "https://github.com/jacobprezant/plethora")!)
                }
            }
        }
        .fileImporter(isPresented: $showIPA, allowedContentTypes: [UTType(filenameExtension: "ipa")!]) { result in
            if case .success(let f) = result, f.startAccessingSecurityScopedResource() {
                defer { f.stopAccessingSecurityScopedResource() }
                DispatchQueue.main.async {
                    ipaURL = f
                    origID = getOriginalBundleID(from: f)
                    let nid = (provisionURL?.startAccessingSecurityScopedResource() == true) ? {
                        defer { provisionURL?.stopAccessingSecurityScopedResource() }
                        return updateBundleID(in: f, usingProvisionAt: provisionURL!)
                    }() : nil
                    newID = getOriginalBundleID(from: f) ?? nid
                }
            }
        }
        .sheet(isPresented: $showPicker) {
            DocumentPicker(contentTypes: [.mobileprovision]) { url in
                if url.startAccessingSecurityScopedResource() {
                    defer { url.stopAccessingSecurityScopedResource() }
                    DispatchQueue.main.async {
                        provisionURL = url
                    }
                }
            }
        }
    }
}


struct DocumentPicker: UIViewControllerRepresentable {
    let contentTypes: [UTType], onPick: (URL) -> Void
    func makeCoordinator() -> Coordinator { Coordinator(onPick: onPick) }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let onPick: (URL) -> Void
        init(onPick: @escaping (URL) -> Void) { self.onPick = onPick }
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if let u = urls.first { onPick(u) }
        }
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {}
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(forOpeningContentTypes: contentTypes)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
}
