//
//  MapViewController.swift
//  Check_It
//
//  Created by 류창휘 on 2023/01/06.
//

import UIKit
import SwiftUI
import MapKit

struct MapViewController: UIViewRepresentable {
    @Binding var coo : CLLocationCoordinate2D
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
    
    }
    
    class Coordinator : NSObject, MKMapViewDelegate {
        var parent : MapViewController
        
        init(_ parent: MapViewController) {
            self.parent = parent
        }
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = .red
            circleRenderer.fillColor = UIColor.yellow.withAlphaComponent(0.3)
            circleRenderer.lineWidth = 1.0
            return circleRenderer
        }
    }
}

//struct MapViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        MapViewController()
//    }
//}
