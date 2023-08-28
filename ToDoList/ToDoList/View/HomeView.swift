//
//  HomeView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var todoStores: ToDoStore = ToDoStore()
    @State private var isShowingSheet: Bool = false
    
    @State private var todoLists: String = "Hello"
    
    
    private var isToDoEmpty: Bool {
        return todoStores.todoArray.isEmpty
    }
    // toDoStore가 비어있음을 나타내는 계산속성
    // ToDoList가 비어있으면 사용자에게 값이 현재 없음을 알려준다.
    
    var body: some View {
        VStack {
            if isToDoEmpty {
                VStack(alignment: .center) {
                    Text("일정이 비어있음")
                        .font(.title)
                        .padding(.top, 200)
                }
            }
            
            List {
                // 현재는 달력에서 일정을 추가할 때는 현재 시간이 있는데 이 시간을 실시간으로 저장을 못 함
                // timeinterval?? ㄴㄴ
                // toDo에서 기본 틀을 이미 정해놨다.
                
                ForEach(todoStores.todoArray) { todoList in
                    NavigationLink {
                        TodoDetailView(todo: todoList)
                    } label: {
                        TodoCellView(todo: todoList)
                    }
                }
                .onDelete { offsets in
                    todoStores.removeWork(at: offsets)
                    // onDelete를 사용하려면 List 안에 ForEach문으로 선언해야 사용가능하다.
                    
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
                PlusToDoView(todoStores: todoStores, isShowingSheet: $isShowingSheet)
            }
            .navigationTitle("To Do List")
            .refreshable {
                todoStores.fetchData()
            }
            .onAppear {
                todoStores.fetchData()
            }
        }
    }
}

//    func observeLightState() {
//        // Firebase의 Realtime DB 내용을 화면에 반영한다
//        // observe를 통해 이 화면이 존재하는 동안
//        // 계속 실시간 반영을 일으킨다
//        databaseRef.child("TodoList").observe(.value) { snapshot in
//            if let value = snapshot.value as? String {
//                todoList = value
//            }
//        }
//    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
