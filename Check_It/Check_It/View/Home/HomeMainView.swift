//
//  Tab1MainView.swift
//  Check_It
//
//  Created by 최한호 on 2023/01/05.
//

import SwiftUI

struct HomeMainView: View {
    @State var showModal: Bool = false
    var body: some View {
        NavigationStack {
            Button(action: {
                showModal.toggle()
            }){
                Image(systemName: "globe")
                    .sheet(isPresented: $showModal) {
                        NavigationStack {
                            MakeGroupModal()
                                .presentationDetents([.large])
                                .navigationTitle("모임 개설하기")
                        }
                    }
            }
        }
    }
}

struct HomeMainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainView()
    }
}
