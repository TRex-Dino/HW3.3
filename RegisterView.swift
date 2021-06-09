//
//  RegisterView.swift
//  HW3.3
//
//  Created by Dmitry on 09.06.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var nameIsValid = false
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            ZStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { checkingTF($0) }
                HStack {
                    Spacer()
                    Text("\(name.count)")
                        .foregroundColor(nameIsValid ? .green : .red)
                        .padding(.horizontal, 25)
                }
            }
            .padding()
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .disabled(!nameIsValid)
            }
        }
    }
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
    
    private func checkingTF(_ text: String) {
        if text.count >= 3 {
            nameIsValid = true
        } else {
            nameIsValid = false
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
