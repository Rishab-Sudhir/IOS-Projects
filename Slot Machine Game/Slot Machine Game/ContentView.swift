//
//  ContentView.swift
//  Slot Machine Game
//
//  Created by Rishab Sudhir on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var Image1 = Image("apple")
    @State private var Image2 = Image("apple")
    @State private var Image3 = Image("apple")
    @State private var Score = 1000
    
    var body: some View {
        VStack {
            Text("SwiftUI Slots!")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Spacer()
            Text("Credits: "+String(Score))
            Spacer()
            HStack{

                Image1
                    .resizable()
                    .scaledToFit()
                Image2
                    .resizable()
                    .scaledToFit()
                Image3
                    .resizable()
                    .scaledToFit()

                
            }
            Spacer()
            Button {
                rand(n: 1)
                rand(n: 2)
                rand(n: 3)
                if ((Image1 == Image2) && (Image1 == Image3) && (Image3 == Image2)){
                    Score += 100
                }else{
                    Score -= 25
                }
                
            } label: {
                ZStack{
    
                    Text("Spin")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                }
                

            }
            Spacer()

        }
    }
    func rand(n: Int){
        let x = Int.random(in: 0...3)
        if n == 1{
            if x == 0{
                Image1 = Image("apple")
            }else if x == 1{
                Image1 = Image("cherry")
            }else{
                Image1 = Image("star")
            }
        }else if n == 2{
            if x == 0{
                Image2 = Image("apple")
            }else if x == 1{
                Image2 = Image("cherry")
            }else{
                Image2 = Image("star")
            }
        }else{
            if x == 0{
                Image3 = Image("apple")
            }else if x == 1{
                Image3 = Image("cherry")
            }else{
                Image3 = Image("star")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
