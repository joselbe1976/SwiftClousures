// Gran Central Dispach  Hoja 2

import UIKit


func dp( s: String){
    print("--> \(Thread.current.description)      --   \(s)")
}

//Cola Serie, ekecuta una a una clausuras

let serialKiller1 = DispatchQueue(label: "Jack The ripper")
let serialKiller2 = DispatchQueue(label: "Jack The ripper2")

serialKiller1.async {
    dp(s: " killing person 1")
}

serialKiller1.async {
    dp(s: " killing person 2")
}

serialKiller2.async {
    for i in 0...10{
        dp(s: "Hilosss  \(i)")
    }
}
serialKiller1.async {
    dp(s: " killing person 3")
}

for i in 0...10{
    dp(s: "\(i)")
}



