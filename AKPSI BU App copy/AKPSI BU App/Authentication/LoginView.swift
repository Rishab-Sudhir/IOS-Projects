//
//  LoginView.swift
//  AKPSI BU App
//
//  Created by Rishab Sudhir on 15/06/23.
//

import Foundation
import SwiftUI

struct LoginView: View {
  // 1
  @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        VStack (alignment: .center){
            Image("CrestOutlineBigger")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Spacer().frame(height:20)
            
            Text(Constants.title)
                .fontWeight(.black)
                .foregroundColor(Color(.white))
                .font(.largeTitle)
                .multilineTextAlignment(.center)
//                .padding(.top, 100)
            
            Spacer()
                .frame(height: 3)
            
            Divider()
                .frame(width: 175, height: 3)
                .overlay(.white)
            
            Spacer()
                .frame(height: 3)
            
            Text(Constants.subTitle)
                .fontWeight(.black)
                .foregroundColor(Color(.systemYellow))
                .font(.custom("LeagueSpartan", fixedSize: 30))
                .multilineTextAlignment(.center)

            // 3
            
            Spacer().frame(height:20)
            
            GoogleSignInButton()
                .padding(.horizontal, 10)
                .onTapGesture {
                    viewModel.signIn()
                }
            Spacer()
        }.background(
            Color.AKPSIBlue
//            LinearGradient(
//                colors: [.AKPSIBlue, .white],
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
        )
        .alert(isPresented: Binding<Bool>.init(
            get: { viewModel.errorMessage != nil },
            set: { _ in viewModel.errorMessage = nil }
        )) {
            
            // TODO: - create showAlert func
            Alert(
                title: Text("Authentication Error"),
                message: Text(viewModel.errorMessage ?? ""),
                dismissButton: .default(Text("OK")) {
                    viewModel.errorMessage = nil
                }
            )
        }
    }
     
    //TODO: - Change strigs to constants
    enum Constants {
        static let title = "AKPSI"
        static let subTitle = "NU Chapter"
        static let title1 = "AKPSI"
        static let title2 = "AKPSI"
    }
}
