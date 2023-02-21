//
//  InfoView + extishon.swift
//  Drinks
//
//  Created by Mac on 18/2/23.
//

import Foundation
import UIKit
extension UIViewController{
    static var indificator:String{
        return String(describing: self)
        
    }
    static func install() -> Self{
        let storubord = UIStoryboard(name: "InfoView", bundle: nil)
        return
         storubord.instantiateViewController(identifier: indificator) as! Self
        
    }
}
