// Gran Central Dispach

import UIKit


func dp( s: String){
    print("--> \(Thread.current.description)      --   \(s)")
}

//Cola Serie, ekecuta una a una clausuras

let serialKiller = DispatchQueue(label: "Jack The ripper")

serialKiller.async {
    dp(s: " killing person 1")
}

serialKiller.async {
    dp(s: " killing person 2")
}

serialKiller.async {
    for i in 0...10{
        dp(s: "Hilosss  \(i)")
    }
}
serialKiller.async {
    dp(s: " killing person 3")
}

for i in 0...10{
    dp(s: "\(i)")
}


