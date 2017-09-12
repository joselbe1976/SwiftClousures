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
        
        
        
        let downloadShopsInteractor : DownloadAllShopsInteractor = DownloadShopsInteractorNSURLSessionImple()
        /*
            downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
                // OK
         
            }) { (error: Error) in
                // ERROR
         
            }
         */
        
        
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            //OK
            print(Thread.current.description)
            self.shops = shops
            
            self.collection.delegate = self
            self.collection.dataSource = self
            
        })
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let shop  = self.shops?.get(index: indexPath.row) //asigno la tienda
        
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop) //lanzamos el secue
    }
    
    //envia el Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController //cast a la clase para acceder a sus atrinutos
            //let indexPath =  self.collection.indexPathsForSelectedItems![0] //extraigo la tienda uw me han tocado
            vc.shop =  sender as! Shop // self.shops?.get(index: indexPath.row) //asigno la tienda
        }
    }

    

}

