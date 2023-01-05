//
//  ContentView.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelection = 1
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            NavigationStack{
                Tab1MainView()
            }.tabItem{
                    Image(systemName: "house")
                    Text("홈")
            }.tag(1)
            
            NavigationStack{
                Tab2MainView()
            }.tabItem{
                    Image(systemName: "checklist")
                    Text("출결 현황")
            }.tag(2)
            
            NavigationStack{
                Tab3MainView()
            }.tabItem{
                    Image(systemName: "person")
                    Text("마이")
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
