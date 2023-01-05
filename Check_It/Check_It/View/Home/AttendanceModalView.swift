//
//  AttendanceModalView.swift
//  Check_It
//
//  Created by 이학진 on 2023/01/05.
//

import SwiftUI
import MapKit


struct AttendanceModalView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    
    var body: some View {
        Map(coordinateRegion: $region)
        
    
    }
}

struct AttendanceModalView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceModalView()
    }
}
