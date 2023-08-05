//
//  ContentView.swift
//  Challenge post war card game
//
//  Created by Rishab Sudhir on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var Score = 0
    @State private var inc = true
    var body: some View {
        //initially, each time the button is tapped, call the increase method.
        
        //This will bring the number closer to 50 each time you tap it.

        //When the number in the Text element is over 50, then from now on you should call the decrease method each time the button is tapped.

        //This will cause the number to start dropping towards 0 with each button tap.

        //When the number in the Text element is under 0, then from now on you should call the increase method each time the button is tapped.

        //This cycle should repeat itself. Climb to over 50 and then drop to under 0.
        VStack{
            Spacer()
            Text(String(Score))
                .font(.largeTitle)
                .fontWeight(.bold)
                Button {
                    if inc == true{
                        if Score >= 50{
                            inc = false
                            Decrease()
                        }
                        else if (Score <= 50){
                            Increase()
                        }
                    }else{
                        if Score < 0{
                            inc = true
                            Increase()
                        }
                        else{
                            Decrease()
                        }
                        
                    }
                    
                    
                } label: {
                    Text("Click me")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                Spacer()

            }
           
        }
    func Increase(){
        let x = Int.random(in: 1...11)
        Score += x
    }
    func Decrease(){
        let x = Int.random(in: 1...11)
        Score -= x
        
    }
      

    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
