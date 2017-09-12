

import UIKit

extension String {
    
    func loadImage(into imageView : UIImageView)  {
       let queue =  OperationQueue()
        queue.addOperation {
            
            if let url = URL(string: self),
               let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data) {
                
                //Hilo Principal
                OperationQueue.main.addOperation {
                    imageView.image = image //asignamos
                    
                }
                
            }
        
        }
        
    }
    
    
}
