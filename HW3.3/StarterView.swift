//
//  StarterView.swift
//  HW3.3
//
//  Created by Dmitry on 09.06.2021.
//

import SwiftUI

struct StarterView: View {
//    @EnvironmentObject var user: UserManager
    
    @AppStorage("person") var nameNew = ""
    @AppStorage("logIn") var logIn = false
    
    var body: some View {
        Group {
            if logIn {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
