
import UIKit

// Map, reduce, filter. Are function of First Class.


let basket = ["🍏","🍉","🍑","🍍","🍉","H"]

// Filter == SELECT of SQL


//Hand filter

var result = [String]()
for fruit in basket{
    if fruit == "🍉" {
        result.append(fruit)
    }
}


//With filter as external parameter

//filter evo 1
basket.filter({ (s: String) -> Bool in
    return s == "🍉"
})

//filter evo 2
basket.filter{  $0 == "🍉" }
basket.filter{  $0 != "🍉" }



// ----------------------------------------------------------------------
// --- MAP   =  UPDATE of SQL

basket.map { (e: String) -> String in
    return e + "🍴"
}

basket.map { (e: String) -> Int in
    return e.lengthOfBytes(using: String.Encoding.utf8)
}


let url = [
    
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Darth_Vader_-_cosplay_%28white%29.jpg/1200px-Darth_Vader_-_cosplay_%28white%29.jpg"
    ,
    "https://srv.latostadora.com/designall.dll/yes_we_jarl--i:14138546633614138523;x:23;w:520;m:1.jpg"

]



//podemos encadenar los map con filter etc...

url.map{
    URL(string: $0)
}.map{
    do{
       return try Data(contentsOf: $0 as! URL)
    }catch{
        return Data()
    }
}.map{
    UIImage(data: $0)
}



// ----------------------------------------------------------------------
// --- REDUCE   =  funciones agregadas SQL (SUM, MAX, AVG)

basket.reduce(0){
    $0 + $1.lengthOfBytes(using: String.Encoding.utf8)
}

//sumar numero de un array
let numeros = [1,2,3,45]
numeros.reduce(0){
    $0 + $1
}

numeros.reduce(0,+)


func pepe(n1: Int, n2: Int) -> Int{
    return n1 * n2
}

numeros.reduce(1,pepe)

