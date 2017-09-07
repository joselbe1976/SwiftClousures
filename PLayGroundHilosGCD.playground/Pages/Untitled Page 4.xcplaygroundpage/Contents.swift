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
        
        //queremos volver al hilo principal
        
       // forma 1 self.performSelector(onMainThread: #selector(executeOnMainHilo), with: nil, waitUntilDone: true)
        
        OperationQueue.main.addOperation {
            self.executeOnMainHilo()
        }
        
    }
    //el @objc para poder usar selector
    @objc func executeOnMainHilo(){
        dp(s: "Ejecuta en el hilo principal")
    }
    
}

extension Operation{
    func addDependenceSoCool(op: Operation) -> Operation{
        self.addDependency(op)
        return self
    }
}

//creo operaciones
let op1 = Myop(url: "http://www.abc.es/logo1.jpg")
let op2 = Myop(url: "http://www.abc.es/logo2.jpg")
let op3 = Myop(url: "http://www.abc.es/logo3.jpg")


//Añado depependencia, para que se ejecute 3 y  despues 2
//op2.addDependency(op3)
//op2.addDependency(op1)

op2.addDependenceSoCool(op: op3).addDependenceSoCool(op: op1)

//ejecuto las operaciones
Queue.addOperations([op1, op2, op3], waitUntilFinished: false)








