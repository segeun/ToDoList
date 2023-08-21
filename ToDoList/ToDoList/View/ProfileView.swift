//
//  ProfileView.swift
//  ToDoList
//
//  Created by 최세근 on 2023/08/07.
//

import SwiftUI


struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("나의 정보")
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
