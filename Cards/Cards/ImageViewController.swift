import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func loadImageButton(_ sender: Any) {
        //ponemos un asert solo para modo debug, que estoy en hilo principal. Si cumple, salta error al ejecutar.
        assert(Thread.current == Thread.main)
        
        // Pintamos informacion del hilo
        print(Thread.current.description)
        
        //hacemos un delay en el Hilo
        //Thread.sleep(forTimeInterval: 1000)
        
        
        //cargamos la imagen en Paralelo
        DispatchQueue.global().async {
            assert(Thread.current != Thread.main)
            print(Thread.current.description)
            self.loadImage()
        }
        
        
        
    
    }
    
    func loadImage(){
        
        let ImageUrl : String = "https://1.bp.blogspot.com/-9kStPf7CEWo/Vu3ANxcoHpI/AAAAAAAAby4/5hnPeWd6JZQji8XQ9kJcbFprmNgkrMpxA/s640/4.-mona%2BLisa_versus_carmen%2Bde%2BMairena_barrio%2BChino%2BBarcelona_canalla_.jpeg"

        
        if let url = URL(string: ImageUrl){
            let data = NSData(contentsOf: url)
            let image = UIImage(data: data! as Data)
            
            //actulizamos imagen en el hilo principal
            DispatchQueue.main.async {
               self.imagen.image = image
            }
        
        }
        
        
        
        
    }
}
