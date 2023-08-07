//
//  HomeView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var todoStores: ToDoStore
    @State var isShowingSheet: Bool = true
    
    private var isToDoEmpty: Bool {
        return todoStores.toDoStore.isEmpty
    }
    // toDoStore가 비어있음을 나타내는 계산속성
    // ToDoList가 비어있으면 사용자에게 값이 현재 없음을 알려준다.
    
    var body: some View {
        NavigationStack {
            
            VStack {
                if isToDoEmpty {
                    VStack(alignment: .center) {
                        Text("비어있음")
                    }
                }
            }

            List {
                ForEach(todoStores.toDoStore) { todoList in
                    Text("\(todoList.work)")
                        .font(.title2)
                }
                // onDelete를 사용하려면 List 안에 ForEach문으로 선언해야 사용가능하다.
                .onDelete { offsets in
                    todoStores.removeWork(at: offsets)
                }
            }
                .listStyle(.inset)
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
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
                .environmentObject(ToDoStore())
            
        }
    }
