//
//  AddScheduleView.swift
//  Check_It
//
//  Created by 차소민 on 2023/01/05.
//

import SwiftUI
import Firebase

struct AddScheduleView: View {

    var group: Group
    @State var isShowingWebView: Bool = false

    @State var promiseName: String = ""
    @State var date: String = ""
    @State var startTime: String = ""
    @State var endTime: String = ""
    @State var place: String = ""
    @State var rangeLimit: Int = 0
//    @State var location: String = ""
    
    @State var absentMin: String = ""
    @State var lateMin: String = ""
    
    @StateObject var promiseStore: PromiseStore = PromiseStore()

    @EnvironmentObject var userObj: SignUpViewModel
    
    let nowUser = Auth.auth()


    @ObservedObject var viewModel = WebViewModel()
    @State var bar = true
    var convert = AddressConvert()

    var body: some View {
        ScrollView {
            VStack(alignment:.center){
                HStack {
                    Text("일정 추가하기")
                        .font(.title.bold())
                    Spacer()
                }
                
                // 일정 정보
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: .infinity, height:240)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.myYellow, lineWidth: 1)
                        }
                    HStack {
                        VStack(alignment:.leading){
                            Text("일정 정보")
                                .font(.title3)
                                .padding(.top,7)
                            
                            HStack{
                                Image(systemName: "person.2")
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.melon)
                                ZStack {
                                    Rectangle()
                                        .frame(width: 200, height: 0.4)
                                        .padding(.top,25)
                                    TextField("모임 이름", text: $promiseName)
                                        .frame(width: 200)
                                }
                            }
                            .padding(.vertical,7)
                            
                            
                            HStack{
                                Image(systemName: "calendar")
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.melon)
                                ZStack {
                                    Rectangle()
                                        .frame(width: 200, height: 0.4)
                                        .padding(.top,25)
                                    TextField("날짜", text: $date)
                                        .frame(width: 200)
                                }
                            }
                            .padding(.bottom,7)
                            
                            HStack {
                                Image(systemName: "clock")
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.melon)
                                ZStack {
                                    Rectangle()
                                        .frame(width: 65, height: 0.4)
                                        .padding(.top,25)
                                    TextField("시작 시간", text: $startTime)
                                        .frame(width: 65)
                                }
                                Text("~")
                                ZStack {
                                    Rectangle()
                                        .frame(width: 65, height: 0.4)
                                        .padding(.top,25)
                                    TextField("종료 시간", text: $endTime)
                                        .frame(width: 65)
                                }
                            }
                            .padding(.bottom,7)

                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.melon)
                                ZStack {
                                    Rectangle()
                                        .frame(width: 200, height: 0.4) //같은 0.4인데 왜 다 달라보임?
                                        .padding(.top,25)
                                    Button(action: {
                                        isShowingWebView.toggle()
//
                                    }) {
                                        TextField("동아리 장소를 입력해주세요", text: $place)
                                            .frame(width: 200)
                                        Text("장소: \(viewModel.result ?? "")")
                                        
                                    }
                                }

                            }
                            .padding(.bottom, 10)


                        }
                        .padding(.leading, 20)
                        Spacer()
                    }
                }
                .padding(.vertical)
                
                // 결석 기준 시간 정하기
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: .infinity, height:180)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.myYellow, lineWidth: 1)
                        }
                    HStack {
                        VStack(alignment:.leading){
                            Text("지각 / 결석 기준 시간 정하기")
                                .font(.title3)
                                .padding(.top,7)
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.melon)
                                HStack {
                                    TextField("", text: $lateMin)
                                        .frame(width: 68)
                                        .textFieldStyle(.roundedBorder)
                                    Text("분 지나면")
                                    Text("지각").bold()
                                    Text("처리하기!")
                                }
                                .padding(.vertical, 7)
                            }
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.melon)
                                HStack {
                                    TextField("", text: $absentMin)
                                        .frame(width: 68)
                                        .textFieldStyle(.roundedBorder)
                                    Text("분 지나면")
                                    Text("결석").bold()
                                    Text("처리하기!")
                                }
                                .padding(.vertical, 7)
                            }
                        }
                        Spacer()
                    }
                    .padding(.leading, 20)

                }
                
                // 도움말?
                HStack {
                    VStack(alignment: .leading){
                        Text("📌  동아리 최대 인원은 8명 입니다.")
                            .padding(.vertical, 5)
                        Text("📌  출석 인정 반경은 200m 입니다.")
                            .padding(.vertical, 5)
                        Text("📌  출석 인정 시간\n       : 10분전 ~ 시작 시간 정각까지 입니다.")
                            .padding(.vertical, 5)
                    }
                    .padding(.vertical, 25)
                    Spacer()
                }
                .padding(.leading, 20)

                Spacer()   
                
                // 일정 만들기 버튼
                Button {
                    // 일정 만들기

                    let tmp = Promise(promiseName: promiseName, limit: absentMin, lateLimit: lateMin, rangeLimit: rangeLimit, location: location, date: date, startTime: startTime, endTime: endTime)
                    let userIds = nowUser.currentUser?.uid
                    
                    promiseStore.addPromise(tmp)
                    
                    userObj.updatePromises(promiseName: tmp.id, user: userObj.currentUser ?? User(id: "", userEmail: "", userImg: "", userName: "", groups: [""], promises: [""]), id: userIds ?? "")

                    promiseStore.addPromise(Promise(id: UUID().uuidString, promiseName: promiseName, limit: absentMin, lateLimit: lateMin, rangeLimit: rangeLimit, location: location, date: date, startTime: startTime, endTime: endTime), group: group)
                    print(viewModel.result)
                    GeoCodingService().getCoding(address: "\(viewModel.result ?? "")") { location in
                        
                        print(location)
                        promiseStore.addPromise(Promise(promiseName: promiseName, limit: absentMin, lateLimit: lateMin, rangeLimit: rangeLimit, location: "\(location[1]) \(location[0])", date: date, startTime: startTime, endTime: endTime))
                    }
                   
                    
//                    promiseStore.addPromise(Promise(promiseName: promiseName, limit: absentMin, lateLimit: lateMin, rangeLimit: rangeLimit, location: "\(location[1]) \(location[2])", date: date, startTime: startTime, endTime: endTime))
                        
                

                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 60)
                        Text("일정 만들기")
                            .foregroundColor(.white)
                            .font(.title3.bold())
                    }
                }

            }
            //모든 뷰 맞춤 패딩
            .padding(.horizontal, 30)
        }
        .sheet(isPresented: $isShowingWebView) {
            WebView(url: "https://soletree.github.io/postNum/", viewModel: viewModel)
        }
        .onReceive(self.viewModel.bar.receive(on: RunLoop.main)) { value in
            self.bar = value
        }
//        .navigationTitle(Text("일정 추가하기")) // 타이틀로 주면 작아져서 위에 Text로 그냥 쌓음.
    }
}

//struct AddScheduleView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack{
//            AddScheduleView()
//        }
//    }
//}
