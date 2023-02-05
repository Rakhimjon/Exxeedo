//
//  VerificationView.swift
//  Exxeedo
//
//  Created by Behzad Khadim on 28/01/2023.
//

import SwiftUI

struct VerificationView: View {
    @ObservedObject var loginData : LoginDataModel
    @Environment(\.presentationMode) var present
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    HStack{
                        Text("Verify Your Number!")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding()
                    
                    Text("Code sent to \(loginData.phNo)")
                        .font(.title)
                        .foregroundColor(.secondary)
                        .padding()
                }
                .frame(height: UIScreen.main.bounds.height / 1.8)
                .background(Color.white)
                .cornerRadius(20)
            Spacer()
            }
            .background(Color("bg").ignoresSafeArea(.all,edges: .bottom))
            .toolbar{
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        present.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}
