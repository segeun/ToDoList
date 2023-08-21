//
//  PlusToDoView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import SwiftUI

struct PlusToDoView: View {
    
    var todoStores: ToDoStore 
    @Binding var isShowingSheet: Bool
    @State private var newWorkText: String = ""
    @State private var dueDate: Date = Date()
    @State private var showAlert = false
    
    var trimMemo: String {
        newWorkText.trimmingCharacters(in: .whitespaces)
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("NEW TODO") {
                        TextField("Todo Title", text: $newWorkText)
                            .textFieldStyle(.automatic)
                        
                        DatePicker("Date", selection: $dueDate)
                            .datePickerStyle(.graphical)
                    }
                }
                Button {
                    //guard newWorkText.count == 0 else { return
                    // todoStores.add(work: newWorkText, date: dueDate)
                    // isShowingSheet.toggle()
                    //  }
                    //  odoStores.showAlert = true -> guard문 사용했을 때
                    
                    if newWorkText.count == 0 {
                        showAlert = true
                    } else {
                        let todo = ToDo(work: trimMemo)
                        todoStores.add(todo)
                        isShowingSheet.toggle()
                    }
                    
                } label: {
                    Text("추가")
                }
            }
            .navigationTitle("New Work")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("취소")
                    }
                    
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("경고"), message: Text("내용을 채우세요!"))
            }
        }
    }
}

struct PlusToDoView_Previews: PreviewProvider {
    
//    @State static var todo = ToDoStore().sampleTodo
    
    static var previews: some View {
        PlusToDoView(todoStores: ToDoStore(), isShowingSheet: .constant(true))
    }
}
