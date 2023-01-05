//
//  ScanningCameraViewController.swift
//  Check_It
//
//  Created by 류창휘 on 2023/01/05.
//

import UIKit
import SwiftUI
import VisionKit

struct ScanningCameraViewController : UIViewControllerRepresentable {
    @Binding var startScanning: Bool
    @Binding var userId : String
    @Binding var userNickname : String
    @Binding var promiseId : String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let viewController = DataScannerViewController(
            recognizedDataTypes: [.barcode()],
            qualityLevel: .fast,
            recognizesMultipleItems: false,
            isHighFrameRateTrackingEnabled: false,
            isHighlightingEnabled: true)
        
        viewController.delegate = context.coordinator

        return viewController
    }
    func updateUIViewController(_ viewController: DataScannerViewController, context: Context) {
        if startScanning {
            try? viewController.startScanning()
        } else {
            viewController.stopScanning()
        }
    }
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: ScanningCameraViewController
        init(_ parent: ScanningCameraViewController) {
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .barcode(let barcode):
                let details = barcode.payloadStringValue?.components(separatedBy: "\n") ?? ["userId", "userNickname", "promiseId"]
                //유저 uid
                //유저 nickname
                //프로미스 id
                parent.userId = details[0]
                parent.userNickname = details[1]
                parent.promiseId = details[2]
                print("barcode: \(barcode.payloadStringValue ?? "알 수 없음")")


                    dataScanner.stopScanning()
                    dataScanner.dismiss(animated: true)
            default:
                break
            }
        }
    }
}
