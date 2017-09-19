

import Foundation
import CoreData

class SaveAllShopsInteractorImplementation : SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: ((Error) -> Void)?) {
        
        //recorremos cada Shop
        for i in 0...shops.count()-1{
            let shop = shops.get(index: i)
            
            //Creamos el Objeto CoreData Es un Mapping Shop into ShopCD
            let ShopCD = mapShopIntoShopCD(context: context, shop: shop)
        
        }
        
        do{
            try context.save()
            
            onSuccess(shops)
            
        }catch{
            //onError(nil)
        }
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        self.execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    
}

