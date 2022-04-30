//
//  Enumeration.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//

import UIKit
import SCLAlertView
import Localize_Swift

var alertMessageManager: AlertMessageManager?

final class AlertMessageManager: NSObject {
    
    var alertView = SCLAlertView()
    
    class var instance: AlertMessageManager {
        
        if alertMessageManager == nil {
            alertMessageManager = AlertMessageManager()
        }
        
        return alertMessageManager!
    }
    
    func DefaultSCLApperance(_ showCloseButton: Bool) -> SCLAlertView.SCLAppearance {
        
        let appearance = SCLAlertView.SCLAppearance(
            kDefaultShadowOpacity: 0.7,
            kCircleTopPosition: 0.0,
            kCircleBackgroundTopPosition: 0.0,
            kCircleHeight: 56.0,
            kCircleIconHeight:  20.0,
            kTitleTop: 30.0,
            kTitleHeight: 25.0,
            kWindowWidth: UIDevice.isPad() ? ez.screenWidth * 0.5 : ez.screenWidth * 0.85,
            kWindowHeight: 178.0,
            kTextHeight: 90.0,
            kTextFieldHeight: 45.0,
            kTextViewdHeight: 80.0,
            kButtonHeight: 45.0,
            kTitleFont: UIFont.systemFont(ofSize: 18),
            kTextFont: UIFont.systemFont(ofSize: 13),
            kButtonFont: UIFont.boldSystemFont(ofSize: 13),
            showCloseButton: showCloseButton,
            showCircularIcon: true,
            shouldAutoDismiss: false,
            contentViewCornerRadius: 5.0,
            fieldCornerRadius: 3.0,
            buttonCornerRadius: 3.0,
            hideWhenBackgroundViewIsTapped: false
        )
        
        return appearance
    }
    
    func ShowWarningMessage(_ title: String, subTitle: String) {
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(true))
        
        alertView.showWarning(title.localized(), subTitle: subTitle.localized(), closeButtonTitle:"Tamam".localized(), colorStyle: 0xFFD110, colorTextButton: 0x000000, circleIconImage: nil)
    }
    
    func ShowSuccessMessageWithDuration(_ title: String, subTitle: String,duration:TimeInterval) {
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(true))
        
        let timeoutAction: SCLAlertView.SCLTimeoutConfiguration.ActionType = {}
        let timeoutConfiguration = SCLAlertView.SCLTimeoutConfiguration(timeoutValue: duration, timeoutAction: timeoutAction)
        alertView.showSuccess(LocalizationManager.LocalizedString(title, comment: "Bilgi"), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString("Tamam", comment: "Tamam"), timeout: timeoutConfiguration, colorStyle: 0x22B573, colorTextButton: 0xFFFFFF, circleIconImage: nil)
    }
   
    func ShowSuccessMessage(_ title: String, subTitle: String) {
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(true))
        
        alertView.showSuccess(LocalizationManager.LocalizedString(title, comment: "Bilgi"), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString("Tamam", comment: "Tamam"), colorStyle: 0x22B573, colorTextButton: 0xFFFFFF, circleIconImage: nil)
    }
    
    func ShowErrorMessage(_ title: String, subTitle: String) {
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(true))
        
        alertView.showError(LocalizationManager.LocalizedString(title, comment: "Hata"), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString("Tamam", comment: "Tamam"), colorStyle: 0xC1272D, colorTextButton: 0xFFFFFF, circleIconImage: nil)
    }
    
    func ShowInfoMessage(_ title: String, subTitle: String) {
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(true))
        alertView.showInfo(title.localized(), subTitle: subTitle.localized(), closeButtonTitle:"LS016".localized(), colorStyle: 0x2866BF, colorTextButton: 0xFFFFFF, circleIconImage: nil)
    }
    
    func ShowWaitingMessage(_ title: String, subTitle: String) {
      
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(false))
        alertView.showWait(title.localized(), subTitle: subTitle.localized(), closeButtonTitle:"", colorStyle: 0x727375, colorTextButton: 0xFFFFFF, circleIconImage: nil)
    }
    
    func ShowErrorConfirm(_ title: String, subTitle: String, confirmButtonTitle: String, closeButtonTitle: String, showCloseButton: Bool, action:@escaping ()->Void) {
        
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(showCloseButton))
        alertView.addButton(LocalizationManager.LocalizedString(confirmButtonTitle, comment: "LS016".localized()), action: {
            
            self.closeAlertView()
            action()
            
        })
        
        alertView.showError(LocalizationManager.LocalizedString(title, comment: "LS017".localized()), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString(closeButtonTitle, comment: ""),colorStyle: 0xC1272D, colorTextButton: 0xFFFFFF, circleIconImage: nil)
        
    }
    
    func ShowInfoConfirm(_ title: String, subTitle: String, confirmButtonTitle: String, closeButtonTitle: String, showCloseButton: Bool, action:@escaping ()->Void) {
        
    
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(showCloseButton))
        alertView.addButton(LocalizationManager.LocalizedString(confirmButtonTitle, comment: "LS018"), action: {
           
            self.closeAlertView()
            action()
            
        })
        
        alertView.showInfo(LocalizationManager.LocalizedString(title, comment: "Bilgi"), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString(closeButtonTitle, comment: ""),colorStyle: 0x2866BF, colorTextButton: 0xFFFFFF, circleIconImage: nil)
        
    }
    
    func ShowWarningConfirm(_ title: String, subTitle: String, confirmButtonTitle: String, closeButtonTitle: String, showCloseButton: Bool, action:@escaping ()->Void) {
        
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(showCloseButton))
        alertView.addButton(confirmButtonTitle.localized(), action: {
            
            self.closeAlertView()
            action()
            
        })
        
        alertView.showWarning(title.localized(), subTitle: subTitle.localized(), closeButtonTitle: closeButtonTitle.localized(),colorStyle: 0xF3F3F3, colorTextButton: 0x761448, circleIconImage: nil)
        
    }
    
    func ShowSuccessConfirm(_ title: String, subTitle: String, confirmButtonTitle: String, closeButtonTitle: String, showCloseButton: Bool, action:@escaping ()->Void) {
        
        self.closeAlertView()

        alertView = SCLAlertView(appearance: DefaultSCLApperance(showCloseButton))

        alertView.addButton(confirmButtonTitle.localized(), action: {
          
            self.closeAlertView()
            action()
            
        })
        
        alertView.showSuccess(LocalizationManager.LocalizedString(title, comment: "LS022"), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString(closeButtonTitle, comment: ""),colorStyle: 0x22B573, colorTextButton: 0xFFFFFF, circleIconImage: nil)
        
    }
    func ShowAuditApproveReject(_ title: String, subTitle: String, approveButtonTitle: String, rejectButtonTitle: String, approveAction:@escaping ()->Void, rejectAction:@escaping ()->Void) {
        
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(true))
        alertView.addButton(LocalizationManager.LocalizedString(approveButtonTitle, comment: "Onayla"), action: {
            
            self.closeAlertView()
            approveAction()
            
        })
        
        alertView.addButton(LocalizationManager.LocalizedString(rejectButtonTitle, comment: "Reddet"), action: {
            
            self.closeAlertView()
            rejectAction()
            
        })
        
        alertView.showNotice(LocalizationManager.LocalizedString(title, comment: "Uyarı"), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString("İptal", comment: ""), colorStyle: 0x761448, colorTextButton: 0xffffff, circleIconImage: nil)
        
    }
    func ShowAuditRejectConfirm(_ title: String, subTitle: String, textFieldCaption: String,rejectButtonTitle: String, closeButtonTitle: String, action:@escaping (_ returnText: String)->Void) {
        
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(true))
        
        let textField = alertView.addTextField(textFieldCaption)
        textField.placeholder = LocalizationManager.LocalizedString(textFieldCaption, comment: "Sebep Giriniz")
        
        alertView.addButton(LocalizationManager.LocalizedString(rejectButtonTitle, comment: "Reddet"), action: {
            
            self.closeAlertView()
            action(textField.text!)
        })
        
        alertView.showEdit(LocalizationManager.LocalizedString(title, comment: "Sebep"), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString(closeButtonTitle, comment: ""),colorStyle: 0x322d7d, colorTextButton: 0xFFFFFF, circleIconImage: nil)
    }
    
    func ShowEditConfirm(_ title: String, subTitle: String, textFieldCaption: String, confirmButtonTitle: String, closeButtonTitle: String, showCloseButton: Bool, action:@escaping (_ returnText: String)->Void) {
        
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(showCloseButton))
        
        let textField = alertView.addTextField(textFieldCaption)
        textField.placeholder = LocalizationManager.LocalizedString(textFieldCaption, comment: "Sebep Giriniz")
        
        alertView.addButton(LocalizationManager.LocalizedString(confirmButtonTitle, comment: "Devam Et"), action: {
           
            self.closeAlertView()
            action(textField.text!)
            
        })
        
        alertView.showEdit(LocalizationManager.LocalizedString(title, comment: "Sebep"), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString(closeButtonTitle, comment: ""), colorStyle: 0x322d7d, colorTextButton: 0xFFFFFF, circleIconImage: nil)
    }
    
    
    func ShowQuestionDocumentConfirm(_ title: String, subTitle: String, approveButtonTitle: String, rejectButtonTitle: String, approveAction:@escaping ()->Void, rejectAction:@escaping ()->Void) {
        
        
        self.closeAlertView()
        
        alertView = SCLAlertView(appearance: DefaultSCLApperance(true))
        alertView.addButton(LocalizationManager.LocalizedString(approveButtonTitle, comment: "Onayla"), action: {
            
            self.closeAlertView()
            approveAction()
            
        })
        
        alertView.addButton(LocalizationManager.LocalizedString(rejectButtonTitle, comment: "Reddet"), action: {
            
            self.closeAlertView()
            rejectAction()
            
        })
        
        alertView.showNotice(LocalizationManager.LocalizedString(title, comment: "Uyarı"), subTitle: LocalizationManager.LocalizedString(subTitle, comment: ""), closeButtonTitle: LocalizationManager.LocalizedString("İptal", comment: ""), colorStyle: 0x761448, colorTextButton: 0xffffff, circleIconImage: nil)
        
    }
    
    func closeAlertView() {
        UIView.animate(withDuration: 0.3) {
            self.alertView.view.alpha = 0
            self.alertView.hideView()
        }
    }
}
