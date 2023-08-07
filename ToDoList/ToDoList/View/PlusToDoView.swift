//
//  PlusToDoView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import SwiftUI

struct PlusToDoView: View {
    
    @EnvironmentObject var todoStores: ToDoStore
    @Binding var isShowingSheet: Bool
    @State var newWorkText: String = ""
    @State var dueDate: Date = Date()

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("New Work", text: $newWorkText)
                        .textFieldStyle(.automatic)
                    
                    DatePicker("Date", selection: $dueDate)
                        .datePickerStyle(.graphical)
                }
                
                Button {
                    isShowingSheet.toggle()
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
        }
    }
}

struct PlusToDoView_Previews: PreviewProvider {
    static var previews: some View {
        PlusToDoView(isShowingSheet: .constant(true))
            .environmentObject(ToDoStore())
    }
}
