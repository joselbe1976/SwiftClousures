// Gran Central Dispach  Hoja 2

import UIKit


func dp(s: String){
    print("--> \(Thread.current.description)      --   \(s)")
}

//Cola Parallelo. Crea N Hilos por bloques de código

let parallelKiller = DispatchQueue(label: "zzz", qos: .userInteractive, attributes: DispatchQueue.Attributes.concurrent)

dp(s: "1")


parallelKiller.async{
    for _ in 0 ... 10{
        dp(s: "🍡")
    }
}

parallelKiller.async{
    for _ in 0 ... 10{
        dp(s: "🥙")
    }
}





