//
//  AppDelegate.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 7/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //CoreData
    var cds = CoreDataStack()
    var context : NSManagedObjectContext?   //el contexto
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.context = cds.createContext(dbName: "MadridShops").viewContext
        
        //pasamos el contecto
        let nav = self.window?.rootViewController as! UINavigationController //obetenemos el view controller root de la aplicacion, que es el navigator
        let mainvc = nav.topViewController as! MainViewController //buscamos el top ViewController que es de tipo MainViewCOntroller
        mainvc.context = self.context //Le enchufamos la dependencia.
       
        
        return true
    }


    func applicationDidEnterBackground(_ application: UIApplication) {
        //grabamos CoreData
        guard let context = self.context else {return }
        self.cds.saveContext(context: context)
        
    }

   


}

