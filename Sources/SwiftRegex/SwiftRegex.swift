//
//  SwiftRegex.swift
//  Swift-Regex
//
//  Created by Vasiliy Kharitonov on 02.07.2020.
//  Copyright © 2020 Kharit. All rights reserved.
//

import Foundation

extension String {
    
    // Regex to find the first occurence
    func regexFirst(pattern: String) -> String? {
        let range = self.startIndex..<self.endIndex
        
        guard let match = self.range(of: pattern, options: .regularExpression, range: range, locale: nil) else { return nil }
        
        let responseRange = match.lowerBound..<match.upperBound
        let response = String(self[responseRange])
        
        return response
    }
    
    // Regex to find all occurences
    func regex(pattern: String) -> [String] {
        do {
               let regex = try NSRegularExpression(pattern: pattern)
               let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
               return results.map {
                   String(self[Range($0.range, in: self)!])
               }
           } catch let error {
               print("invalid regex: \(error.localizedDescription)")
               return []
           }
    }
}
