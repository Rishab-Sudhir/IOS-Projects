//
//  ContentView.swift
//  Tarot Card 2
//
//  Created by Rishab Sudhir/Maha Alali 
//

import SwiftUI

struct ContentView: View {
    @State private var Card = "0"
    @State private var CardDesc = "desc"
    var body: some View {
        ZStack{
            Image("space-stars-background").resizable()
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                
                Image(Card).resizable().scaledToFit()
                if Card != "0"{
                    Image("Slide"+Card).resizable(resizingMode: .stretch).scaledToFit()
                }
                
                Spacer()
                
                Button {
                    if Card != "0"{
                        Card = "0"
                    }else{
                        Card = (String(Int.random(in: 1..<23)))
                    }
                    
                } label: {
                    Image("button")
                }

                
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
