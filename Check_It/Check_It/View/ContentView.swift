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
                    Image(systemName: "person")
                    Text("탭1")
            }.tag(1)
            
            NavigationStack{
                Tab2MainView()
            }.tabItem{
                    Image(systemName: "person")
                    Text("탭2")
            }.tag(2)
            
            NavigationStack{
                Tab3MainView()
            }.tabItem{
                    Image(systemName: "person")
                    Text("탭3")
            }.tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
