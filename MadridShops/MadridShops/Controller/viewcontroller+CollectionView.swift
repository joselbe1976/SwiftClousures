//
//  viewcontroller+CollectionView.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 7/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import UIKit

extension ViewController :  UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let shops = self.shops{
            return shops.count()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ShopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ShopCell
        
        let shop : Shop = (shops?.get(index: indexPath.row))!
        cell.refresh(shop: shop)
        
        return cell
      
    }
    
    
    
}
