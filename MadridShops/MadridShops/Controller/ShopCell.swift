//
//  ShopCell.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 8/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
  
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    
    // La tienda
    var shop : Shop?
    
    func refresh(shop: Shop){
        self.shop = shop
        
        //asigna los Outlets
        self.tituloLabel.text = self.shop?.name
        self.shop?.logo.loadImage(into: imagen)
        imagen.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imagen.layer.cornerRadius = 30
        }
    }
    
}
