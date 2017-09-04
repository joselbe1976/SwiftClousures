//
//  ViewController.swift
//  Cards
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 5/9/17.
//  Copyright © 2017 jose luis Bustos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myClousure : () ->() = {}
    
    func doSomething(){
        print("Hello")
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myClousure = {
            
            //Debemos poner self para captura semantica
            
            self.doSomething()
        }
        
        //ejecuto clausura
        myClousure()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

