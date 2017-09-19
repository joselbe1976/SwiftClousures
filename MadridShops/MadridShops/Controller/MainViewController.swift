
import UIKit


import FillableLoaders
import CoreData

class MainViewController: UIViewController {

    var  myLoader : WavesLoader?
    var context : NSManagedObjectContext!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let loadingView = DotsLoadingView(colors: nil)
        loadingView.show()
        //loadingView.frame  = self.view.bounds
        self.view.addSubview(loadingView)
        */
  
        
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 180, y: 25))
        starPath.addLine(to: CGPoint(x: 195.16, y: 43.53))
        starPath.addLine(to: CGPoint(x: 220.9, y: 49.88))
        starPath.addLine(to: CGPoint(x: 204.54, y: 67.67))
        starPath.addLine(to: CGPoint(x: 205.27, y: 90.12))
        starPath.addLine(to: CGPoint(x: 180, y: 82.6))
        starPath.addLine(to: CGPoint(x: 154.73, y: 90.12))
        starPath.addLine(to: CGPoint(x: 155.46, y: 67.67))
        starPath.addLine(to: CGPoint(x: 139.1, y: 49.88))
        starPath.addLine(to: CGPoint(x: 164.84, y: 43.53))
        starPath.close()
        starPath.fill()
        
        let myPath = starPath.cgPath
        self.myLoader = WavesLoader.showLoader(with: myPath)
        self.view.addSubview(self.myLoader!)
        
        // Reconocimiento de gestos
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animateView))
        tapGesture.numberOfTouchesRequired = 1 //numero dedos en la pantalla
        tapGesture.numberOfTapsRequired = 1 //numero de veces que debe tocar la pantalla
        self.view.addGestureRecognizer(tapGesture)
        
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(restoreView))
        swipeGesture.direction = .left
        self.view.addGestureRecognizer(swipeGesture)
        
    }

  
    @objc func animateView(){
        UIView.animate(withDuration: 3.0) {
            
            if let v = self.myLoader{
                let newFrame = CGRect(x: v.frame.origin.x, y: v.frame.origin.y + 200, width: v.frame.size.width, height: v.frame.size.height)
                v.frame = newFrame
            }
                
        }
        
    }
    
    
    @objc func restoreView(){
        UIView.animate(withDuration: 3.0) {
            
            if let v = self.myLoader{
                let newFrame = CGRect(x: v.frame.origin.x, y: 0, width: v.frame.size.width, height: v.frame.size.height)
                v.frame = newFrame
            }
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShopShopSegue"{
            let vcx = segue.destination as! ViewController
            vcx.context = self.context
        }
    }
    

}
