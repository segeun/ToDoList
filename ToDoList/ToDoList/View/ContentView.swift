//
//  ContentView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

// ToDoList
// 1. 제목(네비게이션 타이틀), 할 일 추가(텍스트필드)
// 2. 할 일 목록(리스트, 메인 뷰)
// 3. 삭제와 체크 버튼(onDelete, ??)
// 4. 탭뷰를 2개 생성 (홈탭, 프로필탭)
// 5. 메인뷰에는 ToDoList, toolbar와 sheet 활용으로 할 일 추가
// ToDoList 8.17
// 1. Firebase 활용해보는 것 고민


import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var todoStores: ToDoStore
    @State var tapNumber: Int = 1
    @Binding var isShowingSheet: Bool
    

    var body: some View {
        
        TabView(selection: $tapNumber) {
            
            HomeView().tabItem {
                Label("Home", systemImage: "homekit") }
            .tag(1)
            
            ProfileView().tabItem {
                Label("Profile", systemImage: "person.fill") }
            .tag(2)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isShowingSheet: .constant(true))
            .environmentObject(ToDoStore())
    }
}
