//
//  JSONParser.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 12/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation


// Parseado JSON de las tiendas

func parseShops(data: Data) -> Shops {
    
 let shops = Shops()
 
do{
    
        let jsonObject = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>  //convertimos en un diccionario
    
    
        let result = jsonObject["result"] as! [Dictionary<String, Any>]  //lo convertimos a un array de diccionarios
    
    
    
    
        for shopjson in result{
            
            let tienda = Shop(name: shopjson["name"] as! String)
            tienda.address = shopjson["address"]  as! String
            tienda.logo = shopjson["logo_img"]  as! String
            tienda.description = shopjson["description_en"]  as! String
            tienda.image = shopjson["img"]  as! String
            shops.add(shop: tienda)
            
            
        }
    
 } catch{}
    
 return shops
    
}
