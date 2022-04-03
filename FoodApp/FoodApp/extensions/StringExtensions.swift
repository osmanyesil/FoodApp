//
//  StringExtensions.swift
//  FoodApp
//
//  Created by osmanyesil on 4/2/22.
//

import Foundation

extension String{
    func replaceTurkishCharacter() -> String{
        return lowercased(with: Locale(identifier: "en_US"))
                .replacingOccurrences(of: "ö", with: "o")
                .replacingOccurrences(of: "ı", with: "i")
                .replacingOccurrences(of: "ü", with: "u")
                .replacingOccurrences(of: "ç", with: "c")
                .replacingOccurrences(of: "ğ", with: "g")
                .replacingOccurrences(of: "ş", with: "s")
                .replacingOccurrences(of: " ", with: "")
    }
}
