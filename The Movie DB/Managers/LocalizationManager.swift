//
//  Enumeration.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit
import Localize_Swift

final class LocalizationManager: NSObject {
    
    internal static func LocalizedString(_ key:String, comment: String) -> String {
        
        //var returnValue: String? = ""
        
        /*let currentLanguage = UserDefaultManager.SelectedLangaugeItem.Culture
         
         if !currentLanguage.isEmpty {
         
         if let resourceDict = UserDefaultManager.getLanguageResourceDict(currentLanguage) {
         
         returnValue = resourceDict[key] as? String
         
         }
         }*/
        
        //        if returnValue == nil || returnValue!.isEmpty {
        //            returnValue = key.localized()
        //        }
        //
        //        return returnValue!
        
        /*
         var returnValue = key
         
         if let path = NSBundle.mainBundle().pathForResource(Localize.currentLanguage(), ofType: "lproj"), bundle = NSBundle(path: path) {
         returnValue = bundle.localizedStringForKey(key, value: nil, table: nil)
         }
         
         return returnValue*/
        
        return key.localized()
    }
    
    internal static func setCurrentLanguage(language:String? = nil,completionHandler:()->()){
        
        if language != nil{
            if language == "English"{
                Localize.setCurrentLanguage("en")
            }
            else{
                Localize.setCurrentLanguage("tr")
            }
        }
        else{
            if UserDefaultManager.SelectedLangaugeItem.localizedString != nil{
                Localize.setCurrentLanguage(UserDefaultManager.SelectedLangaugeItem.localizedString!)
            }
            else{
                Localize.setCurrentLanguage(Localize.currentLanguage())
            }
        }
        
        completionHandler()
    }
}
