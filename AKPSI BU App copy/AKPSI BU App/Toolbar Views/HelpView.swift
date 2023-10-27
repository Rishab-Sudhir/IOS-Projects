//
//  HelpView.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 8/8/23.
//

import SwiftUI
import Foundation

struct HelpView: View{
    var body: some View{
        ScrollView{
            HelpViewFields()
            Spacer().frame(height: 15)
            LocationsView()
            Spacer().frame(height: 15)
            PCView()
            Spacer()
            
        }
    }
}


