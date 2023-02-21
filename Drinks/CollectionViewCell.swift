//
//  CollectionViewCell.swift
//  Drinks
//
//  Created by Mac on 17/2/23.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    
    
    static let reici = (String(describing: CollectionViewCell.self))
    
    
    
    
    
    
    
    @IBOutlet weak var Imge: UIImageView!
    
    
    
    @IBOutlet weak var lable: UILabel!
    
    
    @IBAction func Button(_ sender: Any) {

    }
    
    
    func displayinfo(kokteli:Drinks){
        lable.text = kokteli.strDrink
        Imge.kf.setImage(with: URL(string: kokteli.strDrinkThumb))
        Imge.layer.cornerRadius = 10
        Imge.layer.shadowColor = UIColor.red.cgColor
        Imge.layer.shadowOffset = .zero
        Imge.layer.shadowOpacity = 1
         
    }
    
}
    
    
    


   
