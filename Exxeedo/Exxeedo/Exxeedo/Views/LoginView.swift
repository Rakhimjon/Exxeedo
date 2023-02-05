//
//  LoginView.swift
//  Exxeedo
//
//  Created by Behzad Khadim on 27/01/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginData = LoginDataModel()
    var rows = ["1","2","3","4","5","6","7","8","9","", "0","delete.left"]
    
    func getWidth(frame: CGRect) -> CGFloat {
        let width = frame.width
        let actualWidth = width - 40
        return actualWidth / 3
    }
    
    func getHeight(frame: CGRect)  -> CGFloat {
        let height = frame.height
        let actualHeight = height - 40
        return actualHeight / 3
    }
    
    func buttonAction(value: String){
        if value == "delete.left" && loginData.phNo != ""{
            loginData.phNo.removeLast()
        }
        if value != "delete.left" {
            loginData.phNo.append(value)
        }
        
    }
    
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    Text("Continue With Cell Number")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                    
                    Image("loginphone")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(1)
                    
                    Text("You'll recieve a 4-digit code to get verified")
                        .font(.title2)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack{
                        VStack(alignment: .leading,spacing: 6){
                            Text("Continue With Cell Number")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            
                            Text("+ \(loginData.getCountryCode()) \(loginData.phNo)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                            }
                        Spacer()
                       
                    NavigationLink(destination: VerificationView(loginData: loginData)) {
                        
                            Text("Verify")
                                .foregroundColor(.black)
                                .padding(.vertical,18)
                                .padding(.horizontal,38)
                                .background(Color(.yellow))
                                .cornerRadius(15)
                        }
                        .disabled(loginData.phNo == "" ? true: false)
                    }
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.1), radius:5,x: 0,y: -5)
                }
                .frame(height: UIScreen.main.bounds.height / 1.8)
                .background(Color.white)
                .cornerRadius(20)
            
                
                GeometryReader{reader in
                    VStack{
                        LazyVGrid(columns: Array(repeating:
                                        GridItem(.flexible(),spacing: 20),count: 3)){
                            ForEach(rows, id: \.self){value in
                                Button{
                                    buttonAction(value: value)
                                }label: {
                                    ZStack{
                                        if value == "delete.left"{
                                            Image(systemName: value)
                                                .font(.title2)
                                                .foregroundColor(.black)
                                        }else {
                                            Text(value)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                        }
                                    }
                                        .frame(width: getWidth(frame: reader.frame(in: .global)),height: getHeight(frame: reader.frame(in: .global)))
                                        .background(Color.white)
                                        .cornerRadius(10)
                                }
                                .disabled(value == "" ? true : false)
                            }
                        }
                    }
                }
                .padding()
            }
            .background(Color("bg").ignoresSafeArea(.all,edges: .bottom))
            .navigationTitle("Exxeedo")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
