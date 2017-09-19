
import Foundation
import CoreData

protocol SaveAllShopsInteractor {
    //execute: save all Shops
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: ((Error) -> Void)?)
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void)
}


