//
//  ContentView.swift
//  bonus1
//
//  Created by User12 on 2020/11/30.
//

import SwiftUI

struct ContentView: View {
    @State private var suit = ["spade", "heart", "diamond", "club"]
    @State private var point = ["3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A", "2"]
    @State private var showAlert = false
    @State private var showSuit = false
    @State private var computerSuit = 0
    @State private var userSuit = 0
    @State private var computerPoint = 0
    @State private var userPoint = 0
    var body: some View {
        ZStack {
            Text("撲克牌比大小")
                .font(.system(size: 33.5, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
                .position(x: 0, y: 0)
                .offset(x: 200, y: 60)
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.white)
                .frame(width: 180, height: 270)
                .position(x: 200, y: 250)
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.white)
                .frame(width: 180, height: 270)
                .position(x: 200, y: 640)
            Button(action:{
                let randSuit = 0...3
                let randPoint = 0...12
                self.computerSuit = randSuit.randomElement()!
                self.userSuit = randSuit.randomElement()!
                self.computerPoint = randPoint.randomElement()!
                self.userPoint = randPoint.randomElement()!
                self.showSuit = true
                self.showAlert = true
            }){
                Text("抽牌")
                    .font(.system(size: 45))
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(50)
            }.offset(x:-8, y:35)
            
            if (self.showSuit){
                if (computerSuit == 0 || computerSuit == 3){
                    Image(systemName: "suit.\(suit[computerSuit]).fill")
                        .resizable()
                        .frame(width: 70, height: 80)
                        .position(x: 200, y: 250)
                }
                else {
                    Image(systemName: "suit.\(suit[computerSuit]).fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 80)
                        .position(x: 200, y: 250)
                        .foregroundColor(.red)
                }
                
                if (userSuit == 0 || userSuit == 3){
                    Image(systemName: "suit.\(suit[userSuit]).fill")
                        .resizable()
                        .frame(width: 70, height: 80)
                        .position(x: 200, y: 640)
                }
                else {
                    Image(systemName: "suit.\(suit[userSuit]).fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 80)
                        .position(x: 200, y: 640)
                        .foregroundColor(.red)
                }
                
                Text("\(point[computerPoint])")
                    .font(.system(size: 33.5, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .position(x: 0, y: 0)
                    .offset(x: 140, y: 150)
                Text("\(point[userPoint])")
                    .font(.system(size: 33.5, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .position(x: 0, y: 0)
                    .offset(x: 140, y: 540)
            }
            else {
                Image(systemName: "questionmark")
                    .resizable()
                    .frame(width: 50, height: 80)
                    .position(x: 200, y: 250)
                Image(systemName: "questionmark")
                    .resizable()
                    .frame(width: 50, height: 80)
                    .position(x: 200, y: 640)
            }
            
        }
        .background(Color(red:158/255, green:158/255, blue:158/255))
        .alert(isPresented: $showAlert) { () -> Alert in
            if (self.userPoint > self.computerPoint){
                return Alert(title: Text("遊戲結果："), message: Text("You win!!!"),dismissButton: .destructive(Text("Play Again")))
            }
            else if (self.userPoint < self.computerPoint){
                return Alert(title: Text("遊戲結果："), message: Text("You lose!!!"),dismissButton: .destructive(Text("Play Again")))
            }
            else {
                if (self.userSuit < self.computerSuit){
                    return Alert(title: Text("遊戲結果："), message: Text("You win!!!"),dismissButton: .destructive(Text("Play Again")))
                }
                else {
                    return Alert(title: Text("遊戲結果："), message: Text("You lose!!!"),dismissButton: .destructive(Text("Play Again")))
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
