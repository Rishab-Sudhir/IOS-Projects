//
//  ContentView.swift
//  Buttons Challenge 2
//
//  Created by Rishab Sudhir on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var Score = 0
    var body: some View {
        VStack {
            Text(String(Score))
                .font(.title)
                .fontWeight(.bold)
                .padding()
            HStack{
                Spacer()
                Button {
                    Score += 2
                } label: {
                    Text("+2")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                Spacer()
                Button {
                    Score = 0
                } label: {
                    Text("0")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                Spacer()
                Button {
                    Score *= 2
                } label: {
                    Text("*2")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                Spacer()

                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
