import Foundation

class DownloadShopsInteractorNSOPimpl : DownloadAllShopsInteractor{
    func execute(onSuccess: @escaping (Shops) -> Void) {
        self.execute(onSuccess: onSuccess, onError: nil) //llamamos al de abajo
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: ((Error) -> Void)? = nil) {
       
        let queue = OperationQueue()
        
      queue.addOperation {
            
        
        
       let urlString = "https://madrid-shops.com/json_new/getShops.php"
        if let url = URL(string: urlString){
            if let data = NSData(contentsOf: url){
                //data tiene los bytes del JSON
                do{
            
                
                    let jsonObject = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>  //convertimos en un diccionario
                    
                    
                    let result = jsonObject["result"] as! [Dictionary<String, Any>]  //lo convertimos a un array de diccionarios
                    
                    let shops = Shops()
                    
                    
                    for shopjson in result{
                        
                        let tienda = Shop(name: shopjson["name"] as! String)
                        tienda.address = shopjson["address"]  as! String
                        tienda.logo = shopjson["logo_img"]  as! String
                        tienda.description = shopjson["description_en"]  as! String
                        
                        shops.add(shop: tienda)
                        
                        
                    }
                    
                    //ejecutamos la clausura devolviendo las tiendas
                        OperationQueue.main.addOperation {
                        
                        //invoco clausura pasandole las tiendas
                        onSuccess(shops)
                    }
                    
                    
                    
                } catch{
                    
                }
            }
        }
        }
        
        
      
       
       
        
        
    }
    
    
    
}
