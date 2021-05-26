//
//  String+Extension.swift
//
//  Created by Alfonso Miranda on 27/02/2020.
//  Copyright © 2020 alfonsomiranda. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    public var localized: String {
        
        return NSLocalizedString(self, comment: "")
    }
    
    public var containsWhitespace: Bool {
        return(self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil)
    }
    
    public var isBlank: Bool {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }
    
    static func localizeWithParams(string: String, stringsToReplace: [String]) -> String {
        
        var string = string
        let pattern = "%@"
        let arrayOcurrencies =  string.components(separatedBy: pattern)
        for index in 0..<arrayOcurrencies.count {
            
            if !stringsToReplace.indices.contains(index) { break }
            let range = string.range(of: pattern)
            string = string.replacingOccurrences(of: pattern, with: stringsToReplace[index], options: .literal, range: range)
        }
        return string
    }
    
    //Log functions
    public func infoLog(functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
        var className = (fileName as NSString).lastPathComponent
        className = (className.replacingOccurrences(of: ".swift", with: ""))
        
        print("ℹ️ [\(className).\(functionName)] : \(self)")
    }
    public func sucessLog(functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
        var className = (fileName as NSString).lastPathComponent
        className = (className.replacingOccurrences(of: ".swift", with: ""))
        
        print("✅ [\(className).\(functionName)] : \(self)")
    }
    public func errorLog(functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
        var className = (fileName as NSString).lastPathComponent
        className = (className.replacingOccurrences(of: ".swift", with: ""))
        
        print("🆘 [\(className).\(functionName) ErrorLine:\(lineNumber)] : \(self)")
    }
    
    func createDate(format: String = Constants.dateFormat) -> Date? {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.date(from: self)
        
        return dateString
    }
    
    func substringWithRegularExpression (regularExpression: String) -> String {
        
        var subString: String? = ""
        
        do {
            
            let regex = try NSRegularExpression(pattern: regularExpression, options: [])
            let nsString = self as NSString
            
            let results = regex.matches(in: self, options: [], range: NSRange(location: 0, length: nsString.length))
            subString = results.map { nsString.substring(with: $0.range) }.first
            
            if subString == nil {
                
                subString = self
                
            }
            
        } catch let error as NSError {
            
            subString = self
            print(error)
            
        }
        
        return subString!
    }
    
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    
    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    var length: Int {
        return self.count
    }
    
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1", "Sí", "Si":
            return true
        case "False", "false", "no", "0", "No":
            return false
        default:
            return nil
        }
    }
    
    subscript (index: Int) -> String {
        return self[index ..< index + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (range: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, range.lowerBound)),
                                            upper: min(length, max(0, range.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else { return nil }
        return html
    }
    
    func moneyAttributedString(normalFont: UIFont? = UIFont(name: "Geomanist-WZ-Light", size: 15), smallFont: UIFont? = UIFont(name: "Geomanist-WZ-Light", size: 12.5)) -> NSAttributedString? {
        let decimalIndex = self.firstIndex(of: ",") ?? self.endIndex
        let decimalPart = self[decimalIndex...]
        let normalAttributes = [NSAttributedString.Key.font: normalFont]
        let smallAttributes = [NSAttributedString.Key.font: smallFont]
        
        let attributedString = NSMutableAttributedString(string: self, attributes: normalAttributes as [NSAttributedString.Key: Any])
            
        attributedString.addAttributes(smallAttributes as [NSAttributedString.Key: Any], range: NSRange(location: decimalPart.startIndex.utf16Offset(in: self), length: decimalPart.count))
        return attributedString
    }
    
    func securePath() -> String {
        if self.hasPrefix("http://") {
            let range = self.range(of: "http://")
            var newPath = self
            newPath.removeSubrange(range!)
            return "https://" + newPath
        } else {
            return self
        }
    }
}

extension StringProtocol where Self: RangeReplaceableCollection {
    
    mutating func insert(separator: Self, every nsymbols: Int) {
        for index in indices.reversed() where index != startIndex &&
            distance(from: startIndex, to: index) % nsymbols == 0 {
                insert(contentsOf: separator, at: index)
        }
    }
    
    func inserting(separator: Self, every nsymbols: Int) -> Self {
        var string = self
        string.insert(separator: separator, every: nsymbols)
        return string
    }
}
