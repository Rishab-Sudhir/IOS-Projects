//
//  LocationsView.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 8/8/23.
//

import SwiftUI

struct LocationsView: View {
    @State var isExpanded: Bool = false

    let usLocations = [
         "Atlanta, GA", "Austin, TX", "Boston, MA", "Brooklyn, NY",
         "Brookline, MA", "Buffalo, NY", "Cambridge, MA", "Charlotte, NC",
         "Chicago, IL", "Cincinnati, OH", "Cranford, New Jersey", "Dallas, TX",
         "Denver, CO", "Durham, NC", "Glenmont, NY", "Hackensack, NJ",
         "Hoboken, NJ", "Honolulu, HI", "Houston, TX", "Jersey City, NJ",
         "Los Angeles, CA", "Louisville, KY", "Malvern, PA", "Miami, FL",
         "Minneapolis, MN", "Montclair, NJ", "Mountain View, CA", "Mystic, CT",
         "New London, CT", "New York, NY", "Orlando, FL", "Philadelphia, PA",
         "Phoenix, AZ", "Portland, OR", "Queens, NY", "Randolph, NJ",
         "Sacramento, CA", "San Diego, CA", "San Francisco, CA", "San Francisco Bay Area",
         "San Jose, CA", "Santa Clara, CA", "Seattle, WA", "Stamford, CT",
         "Sunnyvale, CA", "Toms River, NJ", "Tustin, CA", "Virginia Beach, VA",
         "Washington, DC", "Washington DC, MD"
     ]
     
     let internationalLocations = [
         "Amsterdam, Netherlands", "Barcelona, Spain", "Brazil",
         "Calgary, Canada", "Edinburgh, Scotland", "Germany",
         "Hong Kong", "Jakarta, Indonesia", "Kuala Lumpur, Malaysia",
         "London, UK", "Milan, Italy", "Moscow, Russia", "Mumbai, India",
         "Salzburg, Austria", "Shanghai, China", "Singapore",
         "South Slocan, Canada", "Sri Lanka", "Taiwan", "Thailand",
         "Toronto, Ontario, Canada"
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
            
            Text("Locations in the USA")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 10)
            
            ForEach(usLocations, id: \.self) { location in
                Text(location)
            }
            
            Spacer().frame(height: 10)
            
            Text("Locations outside the USA")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 10)
            
            ForEach(internationalLocations, id: \.self) { location in
                Text(location)
            }
            
            Spacer().frame(height: 10)
            
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
        Text("2")
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
        Text("Locations")
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
