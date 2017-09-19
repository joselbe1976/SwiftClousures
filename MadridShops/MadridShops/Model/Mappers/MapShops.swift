// Map Shops
import Foundation
import CoreData


func mapShopCDIntoShop(shopCD : ShopCD) -> Shop{
    let shop : Shop =  Shop(name: shopCD.name!)
    shop.address = shopCD.address!
    shop.image = shopCD.img!
    shop.logo = shopCD.logo!
    shop.description = shopCD.descrip!
    shop.latitude = shopCD.latitude
    shop.longitude = shopCD.logitude 
    
    return shop
}


func mapShopIntoShopCD(context : NSManagedObjectContext, shop : Shop) -> ShopCD{
    let shopCD =  ShopCD(context: context)
    shopCD.name = shop.name
    shopCD.address = shop.address
    shopCD.img = shop.image
    shopCD.logo = shop.logo
    shopCD.descrip = shop.description
    shopCD.latitude = shop.latitude ?? 0  //si esta vacio o nil, pone 0
    shopCD.logitude = shop.longitude ?? 0  //si esta vacio o nil, pone 0
    
    
    return shopCD
}
