//
//  Enumeration.swift
//  Movie Book
//
//  Created by Osman Tüfekçi on 18.08.2021.
//

import UIKit

final class LanguageItem: NSObject, NSCoding {
    
    var LanguageName: String?
    var Description: String?
    var Culture: String?
    var localizedString: String?
    
    @objc required convenience init?(coder decoder: NSCoder) {
        
        self.init()
        
        self.LanguageName = decoder.decodeObject(forKey: "LanguageName") as? String
        self.Description = decoder.decodeObject(forKey: "Description") as? String
        self.Culture = decoder.decodeObject(forKey: "Culture") as? String
        self.localizedString = decoder.decodeObject(forKey: "localizedString") as? String

    }
    
    @objc func encode(with coder: NSCoder) {
        
        coder.encode(self.LanguageName, forKey: "LanguageName")
        coder.encode(self.Description, forKey: "Description")
        coder.encode(self.Culture, forKey: "Culture")
        coder.encode(self.localizedString, forKey: "localizedString")

    }

}
