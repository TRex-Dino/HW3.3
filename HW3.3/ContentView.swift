//
//  ContentView.swift
//  HW3.3
//
//  Created by Dmitry on 09.06.2021.
//

import SwiftUI

struct ContentView: View {
//    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    @AppStorage("person") var nameNew = ""
    @AppStorage("logIn") var logIn = false
    
    var body: some View {
        VStack {
            Text("Hi, \(nameNew)!")
                .font(.largeTitle)
                .offset(x: 0, y: 50)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 120)
            Spacer()
            StartButtonView(timer: timer)
                .padding()
            ButtonView(text: "Log out", color: .blue) {
//                user.isRegister.toggle()
                logIn.toggle()
            }
            Spacer()
        }
            
    }
}

struct StartButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        ButtonView(text: timer.buttonTitle,
                   color: .red,
                   action: timer.startTimer)
    }
}

struct ButtonView: View {
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}
