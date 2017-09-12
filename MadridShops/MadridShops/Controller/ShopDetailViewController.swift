

import UIKit

class ShopDetailViewController: UIViewController {

    @IBOutlet weak var imageShop: UIImageView!
    @IBOutlet weak var textDetail: UITextView!
    
    public var shop : Shop!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textDetail.text = shop?.description
        self.title = self.shop.name
        
        //carganmos la imagen
        let URLString : String = self.shop.image
        URLString.loadImage(into: imageShop)
    }

   
  

}
