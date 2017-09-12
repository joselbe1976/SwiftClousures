//
//  DownloadShopsInteractorNSURLSessionImple.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 12/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation


class DownloadShopsInteractorNSURLSessionImple : DownloadAllShopsInteractor{
    func execute(onSuccess: @escaping (Shops) -> Void, onError: ((Error) -> Void)?) {
        
        
        let urlString = "https://madrid-shops.com/json_new/getShops.php"
        let session = URLSession.shared
        if let url = URL(string: urlString){
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?,error: Error?) in
                
                assert(Thread.current != Thread.main)
                
                if error == nil {
                    //OK
                    
                    let shops = parseShops(data: data!)
                    OperationQueue.main.addOperation {
                        onSuccess(shops)
                    }
                   
                    
                    
                }else{
                    
                    if let myError = onError {
                        myError(error!)
                    }
                }
            
            }
            task.resume()
            
        
        }
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
   
    
    
}
