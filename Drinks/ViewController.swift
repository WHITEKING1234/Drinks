//
//  ViewController.swift
//  Drinks
//
//  Created by Mac on 12/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var arrya = [Drinks]()
    
    
    
    
    
    @IBOutlet weak var CollectionVIew: UICollectionView!
    
    
    
    @IBOutlet weak var SeachBat: UISearchBar!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        CollectionVIew.backgroundColor =  UIColor(cgColor: CGColor(
            red: 265/265,
          green: 245/265,
           blue: 240/265,
          alpha: 1))
        CollectionVIew.layer.cornerRadius = 20
        SeachBat.layer.cornerRadius = 50
        
        
    }
    
    
    private func setup(){
        CollectionVIew.register(UINib(nibName: CollectionViewCell.reici, bundle: nil),forCellWithReuseIdentifier:CollectionViewCell.reici)
        //        CollectionVIew.dataSource = self
        //        CollectionVIew.delegate = self
        //        CollectionVIew.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reici)
        //    private func setup(){
        CollectionVIew.dataSource = self
        CollectionVIew.delegate = self
        CollectionVIew.collectionViewLayout = UICollectionViewFlowLayout()
        //        Collewcviewcel.register(CollectionViewCell.self,
        ////            UINib(nibName: CollectionViewCell.reuseIdentifier, bundle: nil),
        //            forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier
        //        )
        
        
        Task{
            do{
                try await feth()
                print(arrya)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    private func feth() async throws -> [Drinks]{
        arrya = try await NetworkLayer.shared.fetchData().drinks
        DispatchQueue.main.async {
            self.CollectionVIew.reloadData()
            
        }
        return arrya
    }
}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrya.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reici, for: indexPath)as! CollectionViewCell
        
        let product = arrya[indexPath.row]
        cell .displayinfo(kokteli: product)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //        let vc = storyboard?.instantiateViewController(withIdentifier: "InfoView") as? InfoView
        //        self.navigationController?.pushViewController(vc!, animated: true)
        
        //        if collectionView == CollectionVIew {
        //
        //        } else {

        let vc = storyboard?.instantiateViewController(withIdentifier: "InfoView") as! InfoView
        let model = arrya[indexPath.row]
        vc.dish = model
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 190, height: 220)
    }
}

