//
//  ViewController.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit

final class UserDefaultManager: NSObject {
    
    let prefs: UserDefaults = UserDefaults.standard
    
    internal static var SelectedLangaugeItem: LanguageItem {
        
        get {
            let prefs: UserDefaults = UserDefaults.standard
            var selectedLangaugeItem: LanguageItem = LanguageItem()
            
            if (prefs.object(forKey: "selectedLangaugeItem") != nil) {
                
                let encodedObject :Data = prefs.object(forKey: "selectedLangaugeItem") as! Data
                selectedLangaugeItem = NSKeyedUnarchiver.unarchiveObject(with: encodedObject) as! LanguageItem
            }
            
            return selectedLangaugeItem
        }
        set(value) {
            let selectedLangaugeItem: LanguageItem = value
            
            let encodedObject :Data = NSKeyedArchiver.archivedData(withRootObject: selectedLangaugeItem)
            
            let prefs: UserDefaults = UserDefaults.standard
            prefs.set(encodedObject, forKey: "selectedLangaugeItem")
        }
    }
    
    internal static var LoginUserToken:String {
        get {
            var loginUserToken: String = String()
            let prefs: UserDefaults = UserDefaults.standard
            
            if (prefs.object(forKey: "loginUserToken") != nil) {
                loginUserToken = prefs.string(forKey: "loginUserToken")!
            }
            
            return loginUserToken
        }
        set(value) {
            let loginUserToken: String = value
            let prefs: UserDefaults = UserDefaults.standard
            prefs.set(loginUserToken, forKey: "loginUserToken")
        }
    }
    
    internal static var SessionId:String {
        get {
            var sessionId: String = String()
            let prefs: UserDefaults = UserDefaults.standard
            
            if (prefs.object(forKey: "sessionId") != nil) {
                sessionId = prefs.string(forKey: "sessionId")!
            }
            
            return sessionId
        }
        set(value) {
            let sessionId: String = value
            let prefs: UserDefaults = UserDefaults.standard
            prefs.set(sessionId, forKey: "sessionId")
        }
    }
    
    internal static var isFaved: [String:String] {
        get {
            var isFaved: [String:String] = [:]
            let prefs: UserDefaults = UserDefaults.standard
            
            if (prefs.dictionary(forKey: "isFaved") != nil) {
                isFaved = prefs.dictionary(forKey: "isFaved") as! [String : String]
            }
            
            return isFaved
        }
        
        set(value){
            let isFaved: [String:String] = value
            let prefs: UserDefaults = UserDefaults.standard

            prefs.set(isFaved, forKey: "isFaved")
        }
    }
    
    internal static var ApiKey:String {
        get {
            var ApiKey: String = String()
            let prefs: UserDefaults = UserDefaults.standard
            
            if (prefs.object(forKey: "loginUserToken") != nil) {
                ApiKey = prefs.string(forKey: "apiKey")!
            }
            
            return ApiKey
        }
        set(value) {
            let ApiKey: String = value
            let prefs: UserDefaults = UserDefaults.standard
            prefs.set(ApiKey, forKey: "apiKey")
        }
    }
    
    internal static var Username:String {
        get {
            var username: String = String()
            let prefs: UserDefaults = UserDefaults.standard
            
            if (prefs.object(forKey: "username") != nil) {
                username = prefs.string(forKey: "username")!
            }
            
            return username
        }
        set(value) {
            let username: String = value
            let prefs: UserDefaults = UserDefaults.standard
            prefs.set(username, forKey: "username")
        }
    }
    
    internal static var Password:String {
        get {
            var password: String = String()
            let prefs: UserDefaults = UserDefaults.standard
            
            if (prefs.object(forKey: "password") != nil) {
                password = prefs.string(forKey: "password")!
            }
            
            return password
        }
        set(value) {
            let password: String = value
            let prefs: UserDefaults = UserDefaults.standard
            prefs.set(password, forKey: "password")
        }
    }
    
}
