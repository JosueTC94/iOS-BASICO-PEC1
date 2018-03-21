//
//  Services.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import Foundation

class Services {
    static func validate(username: String, password: String) -> Bool {
        if (username == "uoc" && password == "1234") {
            return true;
        } else {
            return false;
        }
    }
    
    static func validate(code: String) -> Bool {
        if (code == "1234") {
            return true;
        } else {
            return false;
        }
    }
    
    static func calculateFinalAmount(ForAmount amount: Float, WithInterest interest: Double, AndYears years: Double) -> Double {
        let final = Double(amount) * pow(1 + Double(interest), Double(years))
        
        return final
    }
}
