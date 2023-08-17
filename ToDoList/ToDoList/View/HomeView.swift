//
//  HomeView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct HomeView: View {
    
    @EnvironmentObject var todoStores: ToDoStore
    @State var isShowingSheet: Bool = false
    
    @State private var todoList: String = "Hello"
    
    let databaseRef = Database.database().reference().child("TodoList")
    
    private var isToDoEmpty: Bool {
        return todoStores.todoArray.isEmpty
    }
    // toDoStore가 비어있음을 나타내는 계산속성
    // ToDoList가 비어있으면 사용자에게 값이 현재 없음을 알려준다.
    
    var body: some View {
        NavigationStack {
            
            VStack {
                if isToDoEmpty {
                    VStack(alignment: .center) {
                        Text("일정이 비어있음")
                            .font(.title)
                            .padding(.top, 200)
                    }
                }
            }
            
            List {
                // 현재는 달력에서 일정을 추가할 때는 현재 시간이 있는데 이 시간을 실시간으로 저장을 못 함
                // timeinterval?? ㄴㄴ
                // toDo에서 기본 틀을 이미 정해놨다.
                
                ForEach(todoStores.todoArray) { todoList in
                    VStack(alignment: .leading) {
                        Text("\(todoList.work)")
                            .font(.title)
                        
                        //Text("\(todoStores.dueDateFormatted(todoList.date))")
                        // 밑에 방식이 훨씬 효율적으로 보인다. (toDo 연산프로퍼티 사용)
                        
                        Text("\(todoList.dateString)")
                            .font(.footnote)
                    }
                }
                // onDelete를 사용하려면 List 안에 ForEach문으로 선언해야 사용가능하다.
                .onDelete { offsets in
                    todoStores.removeWork(at: offsets)
                }
            }
            .listStyle(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                PlusToDoView(isShowingSheet: $isShowingSheet)
            }
            .navigationTitle("To Do List")
            .onAppear {
                observeLightState()
            }
        }
    }
    
    func observeLightState() {
        // Firebase의 Realtime DB 내용을 화면에 반영한다
        // observe를 통해 이 화면이 존재하는 동안
        // 계속 실시간 반영을 일으킨다
        databaseRef.child("TodoList").observe(.value) { snapshot in
            if let value = snapshot.value as? String {
                todoList = value
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ToDoStore())
        
    }
}
