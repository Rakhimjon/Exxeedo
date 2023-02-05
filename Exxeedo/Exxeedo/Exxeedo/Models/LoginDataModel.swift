//
//  LoginDataModel.swift
//  Exxeedo
//
//  Created by Behzad Khadim on 27/01/2023.
//

import Foundation
import SwiftUI

class LoginDataModel: ObservableObject{
    
    @Published var phNo = ""
    
    func getCountryCode()->String{
        let locale = Locale.current
         var countryCode = ""
         if #available(iOS 16, *) {
             if let value = locale.region?.identifier {
                 countryCode = value
             }
         } else {
             if let value = locale.regionCode {
                 countryCode = value
             }
         }
        return countriesCode[countryCode] ?? ""
    }
}
