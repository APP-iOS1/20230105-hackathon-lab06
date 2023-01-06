//
//  TestView.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/06.
//

import SwiftUI

struct TestView: View {
    @StateObject var groupStore: GroupStore = GroupStore()
    var body: some View {
        Button(action: {
            Task {
//                await groupStore.deleteGroup(groupId: "1E3CDECE-E334-4FBA-AE09-93C451EDE770")
                await groupStore.updateGroupName(groupId: "CC276C7F-C6FF-472C-8361-B42516CF7D1F", groupName: "야구 동아리")
            }
        }){
            Text("호스트 변경")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
