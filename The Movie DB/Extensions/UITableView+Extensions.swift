//
//  UITableView+Extensions.swift
//  The Movie DB
//
//  Created by BIMSER on 25.03.2022.
//
import UIKit

public extension UITableView{
    
    func registerCell<T:UITableViewCell>(cell:T.Type){
        
        self.register(T.classForCoder(), forCellReuseIdentifier: T.className)
        self.register(UINib(nibName: T.className, bundle: nil), forCellReuseIdentifier: T.className)
    }
    
    func cellWithIdentifier<T:UITableViewCell>(cell:T.Type) -> T {
        
        let genericCell = self.dequeueReusableCell(withIdentifier: T.className) as! T
        return genericCell
    }
    
    func cellWithIdentifierNoneSelection<T:UITableViewCell>(cell:T.Type) -> T {
        
        let genericCell = self.dequeueReusableCell(withIdentifier: T.className) as! T
        genericCell.selectionStyle = .none
        return genericCell
    }
    
    func cellWithIdentifierAndIndexPath<T:UITableViewCell>(cell:T.Type,indexPath:IndexPath) -> T {
        
        let genericCell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
        return genericCell
    }
      
}
