import Foundation

func n10(n: Int) -> Int {
    return n * 10
}

n10(n: 4)

//creo la clausura
let c10 = {(n: Int) -> Int in
    return n * 10
}

//creo variable de algo que recibe entero y devuelve entero y se la asigno la cluausra
let c11 : (Int)->Int = c10
let c12 = c10
let c13 = n10

//ejecutamos las clausuras
c13(5)
c11(5)
