//
//  PCView.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 8/8/23.
//

import Foundation

import SwiftUI

struct PCView: View {
    @State var isExpanded: Bool = false

    let PCs = [
        "Alpha", "Alpha Alpha", "Alpha Beta", "Alpha Delta", "Alpha Epsilon",
        "Alpha Gamma", "Beta", "Chi", "Delta", "Epsilon", "Eta", "Founding",
        "Gamma", "Iota", "Kappa", "Lambda", "Mu", "Nu", "Omega", "Omicron",
        "Phi", "Pi", "Psi", "Rho", "Tau", "Theta", "Upsilon", "Xi", "Zeta"
    ]
    
    var body: some View {
        VStack {
            if isExpanded {
                expandedCard

            } else {
                collapsedCard
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleCollapsedState()
                    }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color
                    .Monochrome)
        )
        .padding(.horizontal,15)
        
        .onAppear {
            withAnimation {
                isExpanded = false
            }
        }
    }
    
    private var expandedCard: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack(alignment: .top) {
                    
                    Spacer().frame(width: 16)
                    
                    numericIcon
                    
                    Spacer().frame(width: Constants.CardWidthBetweenIconAndText)
                    
                    titleText
                    
                    Spacer()
                    
                    chevronUp
                    
                }
                .padding(.vertical, Constants.CardVerticalPaddingFromTextIcons) // surrounding padding
                .contentShape(Rectangle())
                .onTapGesture {
                    toggleCollapsedState()
                }
                
                rectangleContainingDetails
            }
        }
    }
    
    private var rectangleContainingDetails: some View {
        VStack{
            
            Spacer().frame(height: 10)
            
            Text("Pledge Classes")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 10)
            
            ForEach(PCs, id: \.self) { location in
                Text(location)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MonochromeLight)
    }

    
    private var chevronDown: some View {
        Image(systemName: "chevron.down")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .padding(.trailing, Constants.CardChevronDistanceFromEdge)
    }
    
    private var chevronUp: some View {
        Image(systemName: "chevron.up")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .padding(.trailing, Constants.CardChevronDistanceFromEdge)
    }
    
    private var numericIcon: some View {
        Text("3")
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .font(.title3)
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(Color.black)
            )
    }
    
    private var titleText: some View {
        Text("Pledge Classes")
            .font(.title2)
            .foregroundColor(.black)
        
    }
    
    private var collapsedCard: some View {
        HStack(alignment: .top) {
            
            Spacer().frame(width: 16)
            
            numericIcon
            
            Spacer().frame(width: Constants.CardWidthBetweenIconAndText)
            
            titleText
            
            Spacer()
            
            chevronDown
            
        }
        .padding(.vertical, Constants.CardVerticalPaddingFromTextIcons) // surrounding padding
        
    }
    
    private func toggleCollapsedState() {
        withAnimation {
            isExpanded.toggle()
        }
    }
}


private enum Constants {
    static let CardHorizontalPadding: CGFloat = 16
    static let CardCornerRadius: CGFloat = 20
    static let CardWidthBetweenIconAndText: CGFloat = 8
    static let CardChevronDistanceFromEdge: CGFloat = 16
    static let CardVerticalPaddingFromTextIcons: CGFloat = 19
}
