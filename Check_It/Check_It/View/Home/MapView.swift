//
//  MapView.swift
//  Check_It
//
//  Created by 이학진 on 2023/01/06.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $locationViewModel.region)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
