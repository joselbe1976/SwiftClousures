//
//  SetExecuteOnceImpl.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 19/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation

class SetExecuteOnceImpl : SetExecutionOnceInteractor{
    func execute() {
    
        let defaults = UserDefaults.standard
        defaults.set("SAVED", forKey: "once")
        defaults.synchronize()
    }
    
}


class ExecuteOnceInteractorImpl : ExecuteOnceInteractor{
    func execute(clousure: () -> Void) {
        let defaults = UserDefaults.standard
        
        //SI no hay nada guardado, es qu eno hay datos
        if let _ = defaults.string(forKey: "once"){
             // Already Saved
        }else {
            clousure() //First Time
        }
        
        
        
       
    }
    
    
}

