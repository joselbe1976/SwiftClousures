//
//  ViewController.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 7/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var context : NSManagedObjectContext!  //alquien me pasa contecto, el appdelegate
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var map: MKMapView!
    let locatManager = CLLocationManager()
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MapKit. Pedimos autorizacion
        self.locatManager.requestWhenInUseAuthorization()
        
        self.locatManager.delegate = self
        self.locatManager.startUpdatingLocation() //inicia la llamad apor actualizaicones de localizacion
        
        
        //nicializacion datos de la aplicacion sino existen
        ExecuteOnceInteractorImpl().execute {
             initialiceData()
        }
        
        self.collection.delegate = self
        self.collection.dataSource = self
        
        
        //Center the map
        let MadridLocation = CLLocation(latitude: 40.41889, longitude: -3.703790)
        self.map.setCenter(MadridLocation.coordinate, animated: true)
       
        
    }
    
    //inicializa los datos de la aplicación
    func initialiceData(){
        let downloadShopsInteractor : DownloadAllShopsInteractor = DownloadShopsInteractorNSURLSessionImple()
        
        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
            //OK
            print(Thread.current.description)
        
            
            
            //almacenamos tiendas en coredata
            let CacheInteractor : SaveAllShopsInteractorImplementation = SaveAllShopsInteractorImplementation()
            CacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                //Almacenado OK, indicamos delegado, para que se actualice bien con lo descargado.
                
                //marco como Almacenado, usando userDefaults
                SetExecuteOnceImpl().execute()
                
                self.collection.delegate = self
                self.collection.dataSource = self
                self._fetchedResultsController = nil //porque la primera vez no habia datos
                self.collection.reloadData() //fuerzo la recarga en esta prinera vez

            })
            
        })
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shop : ShopCD = self.fetchedResultsController.object(at: indexPath)
        
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop) //lanzamos el secue
    }
    
    //envia el Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopDetailViewController //cast a la clase para acceder a sus atrinutos
            let shopCD : ShopCD = sender as! ShopCD
            vc.shop =  mapShopCDIntoShop(shopCD: shopCD)
        }
    }

    
    
    
    // MARK: - Fetched results controller
    var _fetchedResultsController: NSFetchedResultsController<ShopCD>? = nil
    
    
    
    var fetchedResultsController: NSFetchedResultsController<ShopCD> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        
        // fetchRequest = select * from table order by xxxxxx
        
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopsCacheFile")
        //_fetchedResultsController = self
         //  _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }

    
    // MARK: Location manager
    
    //cada cambio en el mapa, que se centre en mi
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        self.map.setCenter(location.coordinate, animated: true)
    }
}

