//
//  DownloadAllShopsInteractorFakeImplementation.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 7/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation


class DownloadAllShopsInteractorFakeImplementation : DownloadAllShopsInteractor{
    func execute(onSuccess: @escaping (Shops) -> Void) {
        self.execute(onSuccess: onSuccess, onError: nil) //llamamos al de abajo
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: ((Error) -> Void)? = nil) {
        
        let shops = Shops()
        
        for i  in 0...10{
            let shop = Shop(name: "Sho number \(i)")
            shop.address = "Direccion \(i)"
            shops.add(shop: shop)
    
        }
        
        OperationQueue.main.addOperation {
            
            //invoco clausura pasandole las tiendas
            onSuccess(shops)
        }
        
        
    }
    
    
    
}
