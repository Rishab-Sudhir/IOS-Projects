//
//  HelpViewFields.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 8/8/23.
//

import SwiftUI

struct HelpViewFields: View {
    @State var isExpanded: Bool = false
    private let categories = [
        "Accounting",
        "Advertising",
        "Aviation",
        "Consulting",
        "Data",
        "Design",
        "Education",
        "Engineering",
        "Entertainment",
        "Entrepreneurship",
        "Finance",
        "Film",
        "Gaming",
        "Global M&A",
        "Healthcare",
        "Hospitality",
        "HR",
        "Information Systems",
        "IT",
        "Jewelry",
        "Law",
        "Marketing",
        "Media",
        "Military",
        "Music",
        "N/A",
        "Operations",
        "Product Management",
        "Real Estate",
        "Research",
        "Retail",
        "Sports Management",
        "Strategy",
        "Student",
        "Sustainability",
        "SWE",
        "Tech",
        "Data Science"
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
        VStack(spacing: 20) {
            
            Spacer().frame(height: 10)
            
            Text("Fields listed are the broad categories that you can filter through. Within the database there are variations E.g. Data has Data/Finance etc.")
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 10)
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            Spacer().frame(height: 20)
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
        Text("1")
            .padding(.horizontal, 7)
            .padding(.vertical, 2)
            .font(.title3)
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(Color.black)
            )
    }
    
    private var titleText: some View {
        Text("Fields")
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
