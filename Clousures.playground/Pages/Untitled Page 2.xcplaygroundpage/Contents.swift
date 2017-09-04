import Foundation

func ripley(spaceShip: String){
    let name = "Ripley"
    
    func alien(){
        let alienName = "Alien 547"
        print("Destroy \(name) my name is \(alienName) in Ship \(spaceShip)")
    }
    
    let alienClosure = {() -> Void in
        let alienName = "Alien 547"
        print("Destroy \(name) my name is \(alienName) in Ship \(spaceShip)")
    }
    alienClosure() //llamo clousura como una funcion
    let otherAlienClousure = alienClosure //copio
    otherAlienClousure()
    
    alien()
}

ripley(spaceShip: "Nostromo")
ripley(spaceShip: "Slave I")
