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
            
                    //parseamos
                    let shops = parseShops(data: data as Data)

                    
                    //ejecutamos la clausura devolviendo las tiendas
                        OperationQueue.main.addOperation {
                        
                        //invoco clausura pasandole las tiendas
                        onSuccess(shops)
                    }
                    
                    
                    
                } catch{}
            }
        }
        }
        
        
      
       
       
        
        
    }
    
    
    
}
