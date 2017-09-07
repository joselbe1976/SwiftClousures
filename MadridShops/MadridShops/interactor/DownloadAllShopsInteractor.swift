//
//  DownloadAllShopsInteractor.swift
//  MadridShops
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 7/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import Foundation


protocol DownloadAllShopsInteractor {
    //execute: download all shops on main thread
    func execute(onSuccess: @escaping (Shops) -> Void, onError: ((Error) -> Void)?)
     func execute(onSuccess: @escaping (Shops) -> Void)
}


