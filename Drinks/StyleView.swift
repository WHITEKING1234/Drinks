//
//  StyleView.swift
//  Drinks
//
//  Created by Mac on 17/2/23.
//

import Foundation
import UIKit

class Style:UIView{
    override init(frame:CGRect){
        super.init(frame:frame)
        setup()
    }
    required init?(coder:NSCoder){
        super.init(coder:coder)
        setup()
    }
    
    private func setup(){
        layer.shadowColor = UIColor.black.cgColor
        layer .shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.cornerRadius = 10
        
    }
}
