//
//  InfoView.swift
//  Drinks
//
//  Created by Mac on 18/2/23.
//

import UIKit

class InfoView: UIViewController {
    
    
    
    
    @IBOutlet weak var Imgekoklet: UIImageView!
    
    
    @IBOutlet weak var LableInfo: UILabel!
    
    @IBOutlet weak var lableName: UILabel!
    
    @IBOutlet weak var Viewcentr: UIView!
    
    
    
    
    var dish:Drinks!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        koktili()
        // Do any additional setup after loading the view.
        Viewcentr.layer.cornerRadius = 20
        lableName.layer.cornerRadius = 20
    }
    private func koktili(){
        Imgekoklet.kf.setImage(with: URL(string: dish.strDrinkThumb))
        LableInfo.text = dish.strInstructions
        lableName.text = dish.strDrink
        
    }
    
}
