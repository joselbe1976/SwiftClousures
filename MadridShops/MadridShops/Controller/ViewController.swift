//
//  ViewController.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 7/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var collection: UICollectionView!
    
    var shops : Shops?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let downloadShopsInteractor : DownloadAllShopsInteractor = DownloadShopsInteractorNSOPimpl()
        /*
            downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
                // OK
         
            }) { (error: Error) in
                // ERROR
         
            }
         */
        
        
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            //OK
            print(shops.get(index: 0).name)
            self.shops = shops
            
            self.collection.delegate = self
            self.collection.dataSource = self
            
        })
        
        
    }

    

}

