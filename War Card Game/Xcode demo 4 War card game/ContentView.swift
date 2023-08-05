//
//  ContentView.swift
//  Xcode demo 4 War card game
//
//  Created by Rishab Sudhir on 1/3/23.
//

// Simple Card game where we have assets of all the cards number 2 to 14, representing 2 till ace. The design portion was done using Zstacks, Vstacks and Hstacks, images, text and spacer modules. We Then choose a random number from 2-14 and change the state variables based on it. State variables allow the UI to update everytime the variable is changed, this means everytime the user click on the button random numbers are generated and we use them to replace the card assets. Then we simply increment the scores using if statements based on the random numbers chosen.

import SwiftUI

struct ContentView: View {
    
    // adding the @State property wrapper to a property declaration will signify that it's a piece of data that the view code relies upon to display the UI. (so it will update the ui everytime its changed) Furthermore, state properties will allow you to change the data it stores.
    
    //private since these values are only used in content view
    @State private var playerCard = "card5"
    @State private var CPU = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack{
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack{ //side by side placement of the cards
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(CPU)
                    Spacer()
                }.padding(20)
                Spacer()
                Button { //using the button action/label format
                    //update the cards and scores
                    
                    //generate a random number between 2 and 13, and then append that to the end of card.
                    let playerRand = Int.random(in: 2...14)
                    //range between 2 and 14, including 2, excluding 14
                    let cpuRand = Int.random(in: 2...14)
                    playerCard = ("card"+String(playerRand))
                    CPU = ("card"+String(cpuRand))
                    //String(playRand) - typecasts playerRand as a String so that it can be concatenated with card
                    if playerRand > cpuRand{
                        playerScore+=1
                    }
                    else if cpuRand > playerRand{
                        cpuScore+=1
                    }
                } label: {
                    Image("button")
                }

                
                Spacer()
                HStack{//side by side placement of Vstacks containing score and name
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        //you can check the box at the bottom on the righthand panel to add padding only to one side
                        Text(String(playerScore))
                        //since playerScore is a integer, we need to set its value to string to pass it into the Text method
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(.white)
            }
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
