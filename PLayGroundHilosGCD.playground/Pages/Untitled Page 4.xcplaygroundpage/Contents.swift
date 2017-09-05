// Operation Queue (GCD más avanzado)

import Foundation

func dp(s: String){
    print("--> \(Thread.current.description)      --   \(s)")
}

//Cola concurrente (en paralelo)
let Queue = OperationQueue()

Queue.addOperation {
    for _ in 0 ... 10{
        dp(s: "🥗")
    }
}

Queue.addOperation {
    for _ in 0 ... 10{
        dp(s: "🥙")
    }
}


// creamos clase personalizada, hace lo mismo, pero es testeable

class Myop : Operation{
    let url: String
    
    init(url: String) {
            self.url = url
    }
    
    override func main() {
        dp(s: "Desacargando \(self.url)")
    }
}

//creo operaciones
let op1 = Myop(url: "http://www.abc.es/logo1.jpg")
let op2 = Myop(url: "http://www.abc.es/logo2.jpg")
let op3 = Myop(url: "http://www.abc.es/logo3.jpg")

//ejecuto las operaciones
Queue.addOperations([op1, op2, op3], waitUntilFinished: false)
